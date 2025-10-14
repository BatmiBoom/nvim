# Treesitter Module Improvements

## Overview

This document outlines proposed improvements to `lua/custom/treesitter.lua` for better readability, robustness, and maintainability.

---

## Readability Improvements

[X] `get_path_to_d_parser` → `construct_path_to_parser` ✅ IMPLEMENTED
[X] `absolute_parser_path` → `PARSER_DIR` (constant convention) ✅ IMPLEMENTED
[X] `absolute_queries_path` → `QUERIES_DIR` (constant convention) ✅ IMPLEMENTED
[X] `parser_extension` → `PARSER_LIB_EXTENSION` (constant convention) ✅ IMPLEMENTED
[X] `folder_name` → `repo_name` (more accurate description) ✅ IMPLEMENTED

## Remove Magic Values

[X] Replace hardcoded `[4]` index for URL parsing ✅ IMPLEMENTED
[X] Replace `' '` (space) placeholder in `queries_location` ✅ IMPLEMENTED

## Fix Documentation

[X] Duplicate comment "Move Builded Parser" ✅ IMPLEMENTED

## Eliminate Duplication in Setup

[X] Language names listed twice ✅ IMPLEMENTED

- [x] Extract language list from `M.parsers` array ✅ IMPLEMENTED
- [x] Loop through parsers to call `vim.treesitter.language.add(parser.name)` ✅ IMPLEMENTED
- [x] Maintains single source of truth ✅ IMPLEMENTED

## Add Function Documentation

[ ] Add detailed doc comments explaining:
[ ] What `location` and `queries_location` fields mean
[ ] Why some parsers need special handling (markdown_inline, typescript, tsx)
[ ] What the build process does at each step

---

## Robustness Improvements

### 1. Error Handling

#### Propagate Errors Properly

- **Current**: Functions return codes but caller doesn't handle them
- **Improved**:
  - Check return codes and fail fast
  - Accumulate errors and report summary
  - Don't continue if critical steps fail

#### Fix Stderr Checking

- **Line 178-180**: Check if stderr is non-empty before notifying
  ```lua
  if cmd.stderr and cmd.stderr ~= '' then
    vim.notify_once(cmd.stderr, vim.log.levels.ERROR)
  end
  ```

#### Handle Installation Failures

- **Lines 288-305**: Add failure handling
  - Stop processing current parser if download fails
  - Skip to next parser instead of attempting build
  - Track failed parsers and report at end
  - Return failure status if any parser fails

#### Enable Cleanup with Error Recovery

- **Line 308**: Uncomment cleanup but add error handling
  - Clean up even if some steps fail
  - Use pcall to ensure cleanup doesn't fail the whole process

### 2. Path Handling

#### Expand Tilde Properly ✅ IMPLEMENTED

- **Lines 5-6**: Use `vim.fn.expand()`
  ```lua
  local PARSER_DIR = vim.fn.expand('~/.config/nvim/parser/')
  local QUERIES_DIR = vim.fn.expand('~/.config/nvim/queries/')
  ```

#### Validate Directory Existence ✅ IMPLEMENTED

- **Lines 347-353**: Added directory existence checks in `setup()` function
- **Implementation**: Creates directories if they don't exist using `vim.fn.mkdir()`
  ```lua
  if vim.fn.isdirectory(vim.fn.expand '~/.config/nvim/parser') == false then
    vim.fn.mkdir(vim.fn.expand '~/.config/nvim/parser')
  end
  ```
- **Result**: Prevents cryptic errors on first run

#### Escape Shell Paths

- Quote paths in shell commands to handle spaces and special characters
  ```lua
  'cd "' .. vim.fn.shellescape(path) .. '" && ...'
  ```
  Or better: use `vim.system()` with array arguments instead of shell strings

### 3. Shell Independence

#### Remove Fish Dependency ✅ IMPLEMENTED

- **Line 55**: Hardcoded `fish` shell will fail for most users
- **Solution Applied**: Changed to use `sh` shell instead:

  ```lua
  -- IMPLEMENTED: Use default shell
  vim.system({ 'sh', '-c', cmd }, { text = true })
  ```

- **Result**: Now works for all users, not just fish shell users

### 4. URL Parsing

#### Make URL Parsing Robust ✅ IMPLEMENTED

#### Track Installation State

- Create state file tracking which parsers are installed
- Skip already-installed parsers (with option to force reinstall)
- Cache build artifacts to avoid rebuilding

### 6. Parser Info Validation

#### Validate Parser Definitions

- Check required fields exist: `name`, `url`, `filetype`
- Validate optional fields have correct types
- Add validation function:
  ```lua
  local function validate_parser_info(parser)
    assert(parser.name, "Parser missing 'name' field")
    assert(parser.url, "Parser missing 'url' field")
    assert(parser.filetype, "Parser missing 'filetype' field")
  end
  ```

#### Handle Edge Cases

- **Line 228-229**: Simplify parser_name fallback
  ```lua
  local parser_name = parser_info.parser_name ~= ''
    and parser_info.parser_name
    or parser_info.name
  ```

### 7. Notifications

#### Fix Blocking Notifications ✅ IMPLEMENTED

- **Lines 287-304**: `vim.notify_once()` calls pause execution when message window fills
- **Solution Applied**: Wrap notifications with `vim.schedule()` to defer them
  ```lua
  vim.schedule(function()
    vim.notify('Message', vim.log.levels.INFO)
  end)
  ```
- **Result**: Notifications no longer block the installation process

### 8. Concurrency

#### Parallelize Parser Installation

- **Lines 284-309**: Sequential processing is slow (20+ parsers installed one at a time)
- **Current**: Each parser blocks until complete: download → build → move → next parser
- **Improved**: Launch all parsers concurrently, keep per-parser steps sequential

**Implementation approach**:

```lua
-- Convert run_command to async with callback
local function run_command_async(cmd, callback)
  vim.system({ 'sh', '-c', cmd }, { text = true }, function(result)
    vim.schedule(function()
      callback(result)
    end)
  end)
end

-- Chain operations for a single parser (sequential per parser)
local function process_parser_async(parser_info, on_complete)
  download_async(parser_info, function(download_result)
    if download_result.code ~= 0 then
      on_complete(false)
      return
    end

    build_async(parser_info, function(build_result)
      if build_result.code ~= 0 then
        on_complete(false)
        return
      end

      move_parser_async(parser_info, function(move_result)
        if move_result.code ~= 0 then
          on_complete(false)
          return
        end

        move_queries_async(parser_info, function(queries_result)
          cleanup_async(parser_info, function()
            on_complete(true)
          end)
        end)
      end)
    end)
  end)
end

-- Launch all parsers in parallel
M.install_tree_sitters_parsers = function()
  local total = #M.parsers
  local completed = 0
  local failed = {}

  for i = 1, total do
    local parser = M.parsers[i]
    process_parser_async(parser, function(success)
      completed = completed + 1

      if not success then
        table.insert(failed, parser.name)
      end

      if completed == total then
        vim.schedule(function()
          if #failed == 0 then
            vim.notify('All parsers installed successfully!', vim.log.levels.INFO)
          else
            vim.notify(
              string.format('Installation complete. %d failed: %s',
                #failed, table.concat(failed, ', ')),
              vim.log.levels.WARN
            )
          end
        end)
      end
    end)
  end
end
```

**Benefits**:

- Much faster installation (parallel network/build operations)
- Each parser's steps remain sequential (respecting dependencies)
- Better error tracking and reporting
- Non-blocking UI throughout entire process

**Optional enhancements**:

- Limit concurrent operations (e.g., max 4-6 parsers at once) to avoid resource exhaustion
- Add progress notifications: "Installing parsers... (5/23 complete)"
- Use semaphore pattern for concurrency limiting

### 9. Consistent Patterns

#### Standardize Optional Field Handling

- **`move_queries` vs `move_parsers`**: Inconsistent handling of optional fields
- **Improved**: Create helper function for path construction
  ```lua
  local function get_queries_source_path(parser_info)
    -- Centralize logic for determining queries location
  end
  ```

#### Consistent Return Value Checking

- Some places: `if cmd.code == 0 then`
- Other places: `if result ~= 0 then`
- Standardize on one pattern throughout

### 10. Resource Cleanup

#### Enable Cleanup with Safety

- **Line 308**: Commented out cleanup
- **Improved**:
  ```lua
  -- Cleanup source directories after successful installation
  local function safe_cleanup(parser_info)
    local ok, err = pcall(function()
      M.clean_up(parser_info)
    end)
    if not ok then
      vim.notify('Cleanup failed for ' .. parser_info.name .. ': ' .. err,
                 vim.log.levels.WARN)
    end
  end
  ```

#### Add Cleanup Command

- Provide user command to manually clean up all source directories
- Useful for freeing disk space after installation

### 11. Additional Robustness Features

#### Add Logging

- Create detailed log file for installation process
- Include timestamps, commands executed, output
- Helps debugging when installations fail

#### Add Dry-Run Mode

- Allow users to preview what would be installed without actually doing it
- Useful for testing configuration changes

#### Add Progress Reporting

- Show progress indicator (e.g., "Installing 5/23 parsers...")
- Better user experience for long-running operations

#### Add Dependency Checking

- Verify required tools exist before starting:
  - `git` for cloning
  - `npm` for npm install
  - `tree-sitter` CLI for building
- Fail early with helpful error message if missing

#### Add Retry Logic

- Network operations (git clone) can fail temporarily
- Add retry with exponential backoff for transient failures

---

## Implementation TODO List

### Quick Wins (Easy + High Benefit) 🎯

1. **Fix blocking notifications** ✅ IMPLEMENTED
   - Difficulty: Easy | Benefit: High
   - Solution Applied: Wrapped vim.notify with vim.schedule

2. **Fix path expansion (tilde handling)**
   - Difficulty: Easy | Benefit: High
   - Change: `local PARSER_DIR = vim.fn.expand('~/.config/nvim/parser/')`
   - Impact: Prevents path resolution failures

3. **Fix return value of install_tree_sitters_parsers**
   - Difficulty: Easy | Benefit: Medium
   - Change: Return `success, failed_parsers` instead of always `true`
   - Impact: Caller can detect failures

4. **Validate directory existence** ✅ IMPLEMENTED
   - Difficulty: Easy | Benefit: High
   - Solution Applied: Added directory creation in setup() function
   - Impact: Prevents cryptic errors on first run

5. **Fix stderr checking**
   - Difficulty: Easy | Benefit: Medium
   - Change: `if cmd.stderr and cmd.stderr ~= '' then`
   - Impact: Avoids empty error notifications

6. **Eliminate duplicate language list** ✅ IMPLEMENTED
   - Difficulty: Easy | Benefit: Medium
   - Solution Applied: Extract from M.parsers instead of hardcoding twice
   - Impact: Single source of truth, easier maintenance

### Critical Fixes (Medium + High Benefit) 🔧

7. **Remove fish shell dependency** ✅ IMPLEMENTED
   - Difficulty: Medium | Benefit: Critical
   - Solution Applied: `vim.system({ 'sh', '-c', cmd }, ...)`
   - Impact: Works for all users (not just fish users)

8. **Add error handling and propagation**
   - Difficulty: Medium | Benefit: High
   - Check return codes, stop on critical failures
   - Impact: Better failure recovery, clearer error messages

9. **Enable cleanup with error recovery** ✅ PARTIALLY IMPLEMENTED
   - Difficulty: Medium | Benefit: Medium
   - Solution Applied: Cleanup uncommented and enabled (lines 339-341)
   - Could improve: Add pcall wrapper for error recovery
   - Impact: Frees disk space after installation

10. **Add dependency checking**
    - Difficulty: Medium | Benefit: High
    - Check for git, npm, tree-sitter CLI before starting
    - Impact: Fail fast with helpful message instead of cryptic errors

11. **Improve URL parsing robustness**
    - Difficulty: Medium | Benefit: Medium
    - Use regex instead of hardcoded index [4]
    - Impact: Handles different URL formats, more maintainable

### Major Improvements (Hard + High Benefit) 🚀

12. **Implement parallel parser installation**
    - Difficulty: Hard | Benefit: Very High
    - Convert to async with callbacks, launch all parsers concurrently
    - Impact: 5-10x faster installation, non-blocking UI
    - Note: Detailed implementation in section 8

13. **Track installation state**
    - Difficulty: Medium-Hard | Benefit: High
    - Cache which parsers are installed, skip reinstalling
    - Impact: Much faster on subsequent runs, enable updates

### Polish & Maintainability (Varied difficulty, Lower benefit) ✨

14. **Rename functions and variables** ✅ IMPLEMENTED
    - Difficulty: Easy | Benefit: Low
    - Solution Applied: `get_path_to_d_parser` → `construct_path_to_parser`
    - Impact: More readable code

15. **Remove magic numbers** ✅ IMPLEMENTED
    - Difficulty: Easy | Benefit: Low
    - Solution Applied: Replace `[4]` with `[#parsed_url]` for robust URL parsing
    - Impact: Clearer intent, more robust

16. **Add parser info validation**
    - Difficulty: Medium | Benefit: Medium
    - Validate required fields before use
    - Impact: Catch configuration errors early

17. **Shell path escaping**
    - Difficulty: Medium | Benefit: Medium
    - Quote paths or use array arguments
    - Impact: Handles paths with spaces

18. **Add progress reporting**
    - Difficulty: Medium | Benefit: Medium
    - Show "Installing 5/23 parsers..."
    - Impact: Better UX for long operations

19. **Add logging**
    - Difficulty: Medium | Benefit: Low
    - Write detailed log file with commands/output
    - Impact: Easier debugging of failures

20. **Add retry logic**
    - Difficulty: Medium-Hard | Benefit: Medium
    - Retry network operations with exponential backoff
    - Impact: More reliable on poor connections

21. **Add dry-run mode**
    - Difficulty: Medium | Benefit: Low
    - Preview what would be installed
    - Impact: Testing configuration changes

22. **Add cleanup command**
    - Difficulty: Easy | Benefit: Low
    - User command to remove source directories
    - Impact: Manual disk space recovery

23. **Comprehensive documentation**
    - Difficulty: Medium | Benefit: Medium
    - Document edge cases, special parsers
    - Impact: Easier maintenance and contribution

---

## Recommended Implementation Order

**Phase 1 - Critical Fixes** (1-2 hours) ✅ MOSTLY COMPLETED

1. Fix path expansion (#2) ✅ PARTIALLY IMPLEMENTED
2. Remove fish dependency (#7) ✅ IMPLEMENTED
3. Validate directory existence (#4) ✅ IMPLEMENTED
4. Fix stderr checking (#5) ✅ PARTIALLY IMPLEMENTED
5. Add dependency checking (#10) - Still needed

**Phase 2 - Quick Wins** (30 minutes) ✅ MOSTLY COMPLETED

1. Fix return value (#3) - Still needed
2. Eliminate duplicate list (#6) ✅ IMPLEMENTED

**Phase 3 - Error Handling** (1-2 hours)

1. Add error handling (#8)
2. Enable cleanup (#9)
3. Improve URL parsing (#11)

**Phase 4 - Major Feature** (3-4 hours)

1. Implement parallel installation (#12)

**Phase 5 - Polish** (as needed)

1. Track installation state (#13)
2. Add progress reporting (#18)
3. Other items based on user needs
