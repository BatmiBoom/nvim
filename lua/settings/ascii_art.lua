local M = {}

M.girl = {
	"⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⣛⣉⣉⣤⣤⣶⡆⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣿⣿⣿⣿⣷⣆⠹⡎⢻⣿⣿⣿⣿⣿⣿⣶⡄⢻⣿⣧⡈⢿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿",
	"⣛⣻⣭⣭⣽⣴⣶⣶⢠⣶⣿⡏⣼⣿⣿⣿⣿⠀⠸⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⡇⣧⠹⣿⣿⣿⣿⣿⠻⡆⢻⠸⣿⣯⠙⣿⣿⣿⣿⣿⡌⢿⣿⣷⡌⢿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⢰⣿⣿⣿⣿⣿⠀⠂⣿⣿⣿⢸⡇⣿⣿⣿⣿⣿⡇⢹⠀⢿⣿⣿⣿⣿⣇⠘⡄⠃⣿⣿⡄⠸⣿⣿⣿⣆⠹⡀⢿⣿⣷⡈⣿⣿⣿⣿⠀⡿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⢸⣿⣿⣿⣿⡟⡀⠀⢻⣿⣿⢸⡆⢻⣿⣿⣿⣿⣿⠀⢠⠘⣿⣿⣿⣿⣿⡆⠈⡀⣿⣿⡇⣇⠘⣿⣿⣿⡆⠱⡘⣿⣿⣷⠘⣿⣿⣿⣿⣿⣦⢹⣿⣿",
	"⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⡟⢸⣿⣿⣿⣿⠃⣿⣆⠘⣿⣿⡄⡇⠸⣿⣿⣿⣿⣿⡆⢸⡄⢻⣿⣿⣿⣿⣿⠀⠀⢻⣿⠃⣉⠀⢻⠟⠻⢿⠀⠁⢹⣿⣿⣇⠸⣿⣿⣿⣿⣿⣇⢿⣿",
	"⣿⣿⣿⣿⣿⣿⡏⠠⡈⣿⡇⢸⣿⣿⣿⣿⠀⣿⣿⣇⠸⣿⡇⠃⠀⣿⣿⣿⣿⣿⠻⠈⠁⠀⢀⣠⣤⣤⣌⠀⢧⠈⡿⢀⣿⣿⣈⣸⡆⢢⡀⢣⠀⣿⣿⣿⡄⢿⣿⣿⣿⣿⣿⡟⣋",
	"⣿⣿⣿⣿⣿⣿⠃⠀⢇⢸⣇⢸⣿⣿⣿⣿⡄⢿⣿⣿⣆⠙⡿⠀⠀⢹⣿⣿⠿⠿⠀⠀⢰⣾⣿⣿⣿⠿⠏⠿⠂⠄⢃⣾⣿⣿⣿⣿⣷⠈⣷⣸⡄⢸⣿⣿⣷⠸⣿⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣿⣿⢀⣄⡈⠂⢿⡘⣿⣿⣿⣿⡇⢀⣀⣨⣽⠀⡑⠀⢿⡀⠋⣡⣴⣶⣶⣶⣤⣟⡉⠍⢀⣀⣤⠾⠷⠓⠒⠻⠿⠿⣿⣿⣿⡇⢸⣿⣷⣼⣿⣿⣿⡄⢻⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣿⢿⢸⠟⠋⡈⠈⠇⢿⣿⠿⠿⢧⢸⣿⣿⣿⣧⠐⣤⡈⢳⡞⠛⣛⠛⠛⠹⠟⠋⢀⡴⠛⠉⠀⠀⠀⣤⣤⣤⣄⣀⠀⠉⠋⣿⠀⣿⣿⢻⣿⣿⣿⣧⠈⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⡇⣿⢀⣤⣾⣿⣶⣄⠈⣴⣶⣶⣶⡀⢿⣿⣿⣿⡀⠹⢿⣦⣴⣿⣿⣿⣿⣶⠆⡰⠋⠀⠀⢀⣠⣾⠃⣿⣿⣿⣿⣿⣿⣆⠀⢠⠀⣿⡿⢸⣿⣿⣿⣿⡆⠘⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣧⢹⠀⢿⣿⣿⣿⣿⠷⠛⠛⠛⠛⠋⠘⣿⣿⣿⣷⡄⢸⣿⣿⣿⣿⣿⣿⣿⡖⠁⢀⡈⠻⠿⠿⢋⣼⣿⣿⣿⣿⣿⣿⡟⢀⣾⡇⣿⡇⣿⣿⠛⣿⣿⣧⠀⢹⣿⣿⣿⣿",
	"⠻⢋⣉⣉⠉⠘⡀⣿⡿⠋⠁⠀⠀⠈⠉⠉⠉⠐⠀⡈⢻⣿⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿⣇⣠⣿⣿⣷⣧⣾⠿⠿⠛⣛⣛⣛⡻⠟⣡⠾⣿⡇⣿⠀⢿⣿⠄⣿⣿⣿⠀⠈⣿⣿⣿⣿",
	"⣶⣿⣿⣷⠀⠀⠀⠈⠀⠀⣠⣶⣶⡀⢤⣄⣀⣀⠠⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠉⢀⠈⣩⣄⣠⣤⣠⡴⢊⡴⢧⢌⡇⠋⠠⢸⣿⢠⣿⣿⣿⡇⠀⠸⣿⣿⣿",
	"⣿⣿⣿⡏⠀⢀⠀⠀⠀⢺⣿⣿⣿⣿⣦⣈⣋⣉⣴⣿⣿⣿⡧⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠈⢉⡠⠟⣠⡼⢟⡽⢋⡴⠋⠐⣡⠞⠁⣰⡀⢸⡟⢸⣿⣿⣿⣿⢰⡄⢸⣿⣿",
	"⣿⣿⡏⣧⠀⣿⣧⡄⠀⠚⢿⣿⠿⠟⠛⠛⣛⡛⢛⣻⡿⢋⣴⣦⠹⣿⣿⣿⣿⣿⣿⣿⠟⡡⢊⢀⣴⠟⣡⣼⣿⡶⢋⣴⢏⡴⢃⠜⡡⢎⣴⣿⣷⡀⠃⣿⢻⣿⣿⣿⢸⣿⡀⠘⣿",
	"⣿⣿⡇⢿⡄⢹⢿⣿⡤⢐⡖⠀⣠⠶⢂⣼⠟⡡⢫⠟⡰⢛⣿⣿⣷⣽⣿⣿⣿⣿⡿⣣⣮⢴⣷⣿⣥⣾⣯⣿⠟⣡⣿⣧⠎⣤⣵⣞⢀⡏⣿⣿⣿⠏⢸⣿⢸⣿⣿⣿⢼⣿⣇⠸⠹",
	"⣿⣿⣧⠘⣇⠀⢸⣿⣖⡛⢁⡜⠛⢀⡚⢁⠞⡡⢋⣼⣷⣿⣿⣿⣿⣿⣿⣿⣿⣯⣾⣷⣿⣿⣿⣿⣿⣿⣿⣧⣾⣛⠟⣡⣾⣿⣿⣯⣈⣠⣿⣿⠟⣰⣿⠏⢰⣿⣿⣿⣿⣿⣿⡄⢣",
	"⣿⣿⣿⠀⡏⢆⠀⢻⣿⢃⠊⠀⣴⠏⣠⢋⠔⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⡿⠋⣴⠟⡁⢀⢸⣿⣿⣿⡿⣿⣿⡇⠀",
	"⢻⣿⣿⠀⠀⠈⠀⠘⣹⣿⢂⣼⢃⣼⡷⢂⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢛⣋⣍⡛⠛⠿⣿⣿⣿⣿⣿⠟⢁⣾⣿⣿⣿⣿⣿⣿⠿⠋⠀⣊⣴⣾⠇⣞⢸⣿⣿⣿⣇⢿⣿⢇⡀",
	"⢸⣿⣿⡆⠀⠀⠠⣀⠉⢳⡟⢡⣾⣿⣡⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣴⠾⠟⠛⠛⠉⠉⠙⠳⡶⠈⠉⠉⠀⢀⣿⣿⣿⣿⣿⣏⣩⣤⣴⣶⣿⣿⣿⣏⡀⣿⢸⣿⣿⣿⣿⣾⣯⣾⣿",
	"⠀⢿⣿⣿⡀⠄⠀⠸⣷⣦⣀⡛⠛⢻⣿⣿⣿⣿⣿⠉⠻⠟⠁⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣿⠘⣿⣿⣿⢿⣿⣸⣿⣿",
	"⣷⠈⢿⣿⣷⡈⢄⠀⢹⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⢸⠀⣿⣿⣿⢹⣿⣿⣻⣿",
	"⣿⠀⢀⠛⠿⣿⣄⠀⠀⠻⣿⣿⣿⠻⣁⢻⣿⣿⣿⣿⣿⣆⠀⠀⢀⣴⣷⣄⠀⠀⠀⣠⣶⣿⣿⣷⡀⢀⣾⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⣿⣿⢸⣿⣿⣿⢿",
	"⠟⠀⢸⣿⣷⣬⡙⠿⢦⣄⠹⠿⣿⣦⡤⠜⢻⣿⣿⣿⣿⣿⣆⠀⢸⣿⣿⣿⡄⢀⣾⣿⣿⣿⣿⣏⡀⣿⣿⣿⣿⣿⣿⣿⣿⣧⣙⣹⣿⣿⠟⠁⠀⠀⠀⢀⠀⢸⣿⣿⠸⣿⣿⣿⡌",
	"⠚⠀⣾⣿⣿⠟⠀⠀⠀⠉⠉⠀⠠⣤⣤⣶⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿⠁⢸⣿⣿⣿⡿⡷⠈⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⢸⣷⠀⣿⠛⠀⢿⣿⣿⣿",
	"⠀⢾⣿⠟⢁⠀⠀⠀⠀⢀⠀⠄⢰⣬⡙⠻⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⢠⣿⣿⣿⣿⣱⣶⢃⣄⢻⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠆⠈⠉⣷⡜⠀⢁⡎⠙⢿⣿",
	"⣷⣦⣤⡀⠀⠉⠈⠉⠉⠉⠻⠂⠀⣿⣿⠀⠈⠛⢿⣿⣿⣿⣿⠈⣿⣿⣿⡟⠐⣿⣿⣿⣿⣿⠃⣌⠉⣠⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠿⠂⠀⠀⠀⠀⠀⣿⢁⠀⠈⠳⣄⠀⠙",
	"⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⣰⣿⠋⢀⠀⠀⠀⠉⠻⢿⣿⣆⢻⣿⣿⣿⣶⣿⣿⡿⠛⣡⣾⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⣰⠄⠹⣷⣶",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠘⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠌⣿⣿⣿⣿⣿⠋⢰⣿⣿⣿⣿⣿⡿⠟⠋⠀⣀⣀⡀⠀⠀⠀⢀⣀⣠⣤⣶⣶⣾⣿⣿⡟⠀⠀⠀⣹⣶⣀⠘⣿",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡐⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢟⣿⣿⠇⢠⣿⣿⣿⡿⠟⢋⡠⠶⠛⢛⣉⣠⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢾⣻⣾⣻⣦⡈",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⢿⣿⣶⣤⣤⣶⣦⣤⣴⣶⣌⠳⣶⣧⠘⠛⠉⢀⠤⠀⢁⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⢰⣾⣻⣾⣻⣿⣻",
	"⣿⣿⣿⣿⣿⡯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡮⠉⠻⣿⠿⡿⣿⣿⣿⣿⣿⡦⢸⣿⠀⡴⢶⣥⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⣻⣿⣿⣿⣻⣿⣻",
}

M.luffy = {
	"⠠⠀⠀⠀⡟⠸⡁⠀⠀⠀⠀⢠⠆⠑⣄⡀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢄⣀⣀⠴⠒⣑⣾⠋⣠⠺⠈⠀⠉⠉⠛⢷⡄⠀⠀⠀⠈⢳⣇⠀⣰⢟⡛⠙⡉⠄⠆",
	"⣅⠂⠀⠀⠯⢕⡑⠢⠤⠒⠒⠁⠀⠀⢘⠪⢖⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢰⠄⢀⠀⠀⠀⠀⠀⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠊⠁⠀⠀⠀⣠⠗⣍⠴⣣⠄⠁⠀⠀⠀⠀⠀⠉⠁⠀⢠⣶⣾⠭⠶⢯⣈⠓⠋⠁⠐⢶",
	"⠹⡖⢀⡀⠙⠂⠌⡑⠡⢀⠀⠀⠀⠀⡸⠀⠀⠁⠠⢀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⣠⠚⠇⠸⠀⠀⠀⠀⠀⠀⠠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢆⣀⣀⠤⠚⠁⢴⠋⠐⠈⠆⠀⠀⠀⠀⠀⠒⠤⢀⣐⣛⠉⠀⠀⢮⣙⣉⠭⠀⠀⠀⠈",
	"⠳⡿⣯⡕⢤⠀⠈⢰⡏⠉⠳⠲⡤⢔⢅⡀⠀⠀⠀⠀⠁⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⡇⠀⠸⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⡴⠊⠉⠙⢢⡄⠀⠀⠀⠀⠀⠀⠀⢀⣴⠏⠀⠀⠀⠠⢀⡒⠴⣩⢏⣽⢾⣶⢮⣵⣈⠉⠁⠒⠢⢍⡉⠉⠙⠒⢤",
	"⠀⠀⠸⣿⣦⡌⠠⠀⡇⠀⠀⢱⠌⠖⣩⢘⠰⣀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⢱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⢰⡋⠠⡙⣆⠀⠀⢀⠒⣌⢳⣥⣿⣾⣛⣮⡿⣯⣟⣿⣖⣲⡋⠁⠠⠐⠀⡀⠀",
	"⠀⠀⠀⢹⡯⠽⠛⠋⠁⠀⠀⢸⢊⢆⠀⠉⠚⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠒⠂⠤⢀⣀⡠⠤⠞⠁⠀⠀⠀⠀⠀⠀⠤⠦⠭⠟⠃⡟⠀⠀⠠⣘⣾⣿⣿⣿⣿⣿⣷⣿⣷⣿⣟⣯⢷⣹⣭⠷⠆⣁⠀⠀",
	"⠀⠀⠀⢐⣟⠀⠀⠀⠀⠀⠀⢸⠂⡋⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⡇⠀⠀⠀⠀⢡⠀⠀⠀⢸⠑⣄⠀⠀⠀⠀⠀⠀⠀⠙⣄⠀⠀⣠⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⠁⣀⣠⡾⣟⠯⣝⡲⢯⣿⣿⣿⠿⢿⣛⣛⣭⣭⣶⣦⢟⡟⣧⠐⡀",
	"⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠘⣦⠤⣈⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠠⠊⠀⠀⠀⠀⠀⣸⣧⠀⠀⠈⡆⢸⡙⡒⠲⠦⠤⢤⣄⣀⠈⠓⠤⠸⠇⢨⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⡤⠤⠄⠒⠉⠉⠉⠉⢁⠒⡌⢳⣸⣽⣿⣿⢳⣾⣿⣿⣿⣿⣿⣿⢓⣿⣮⡽⠇⡘⢀",
	"⠔⡀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⡇⢈⠉⡐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠐⠠⣀⣿⢿⣷⣤⣀⠘⣼⠁⢈⠆⠒⣩⡴⡂⠙⠵⣄⣀⡀⣀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁⢀⢇⠀⢀⣀⡀⠀⠀⣀⣄⣮⣭⣷⡳⣞⣿⣿⣾⣿⣿⣿⣿⣯⣿⡯⢣⡔⠉⡏⠔⣁⠂",
	"⣀⠀⡀⠈⠢⢄⠀⠀⠀⠀⠀⠀⢡⠂⠌⠠⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠢⠤⡀⠀⠀⠘⣿⢸⣷⡇⠻⣷⣏⣶⣤⡶⠛⠉⠈⠱⡄⠀⢉⡇⠉⠠⠐⣆⠀⠀⠈⠁⠈⠀⠀⠀⠀⢫⡉⡉⢨⡎⠁⠀⠙⠶⠶⣉⠽⣛⠯⣝⢳⣽⣾⣻⢟⣿⢿⣿⣿⣿⣿⢫⠍⠀⠀⠑⠎⠥⠦",
	"⠤⠀⠣⠀⠀⠀⢵⡀⠀⠀⠀⠀⠈⡄⢉⠐⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⣱⠀⠀⢰⣿⣮⣿⣿⠀⠁⠘⣿⡟⠀⡞⣿⣳⠀⣷⡆⣾⠃⣆⠀⠀⠈⣱⠭⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠀⠀⠀⠀⠀⠞⣁⠣⡜⡸⡜⢫⣼⡷⣿⢯⠆⣻⣿⣛⣟⣛⡿⠀⠀⠀⠈⠉⠀⠠",
	"⣄⡀⠀⠀⠄⠀⢸⠃⠀⠀⠀⠀⠀⢱⢀⠈⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢆⡀⢀⣘⣿⣞⡁⠀⠀⠀⠀⠈⢧⡀⠉⠉⢁⣼⢿⠻⣧⣼⣿⡖⣴⣾⣥⡀⢭⠀⠀⢀⣠⣀⣀⣀⡠⣞⠁⠺⡙⢦⠀⣀⠞⠠⠒⡴⠱⡘⢧⢿⣧⣽⣿⣾⣿⣿⡿⢎⡷⠁⠀⠀⣀⠀⠀⣀⣤",
	"⠙⣾⠄⠀⠋⠉⠈⢦⡀⠀⠀⠀⠀⠈⢇⠐⡀⠄⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠒⢦⡀⡠⢦⡴⠊⠉⠁⠛⣿⣿⢿⣗⠀⠀⠀⠀⠀⠉⠉⠉⠉⠐⢁⣱⡿⠛⡟⢠⣾⣷⠾⢁⠇⠀⠰⠉⠒⡴⠁⠀⠀⠈⠓⠐⠁⠀⠉⣠⣸⠄⡃⡔⣣⡹⣜⣮⣽⡿⣻⡭⠗⠒⠋⠁⠀⢀⣶⣿⣿⣶⡿⠛⠉",
	"⠀⢿⠈⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠀⠘⡄⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⣸⡀⠀⣀⣉⢴⠋⠀⠀⢀⠀⠠⠹⣿⡀⠋⢹⠒⠒⡖⠀⡄⠒⢲⠒⠉⣇⠎⠀⢠⣷⣋⣭⣤⣐⠁⡤⠶⠦⣐⣊⠤⣀⣀⠀⠀⠀⠀⢀⣰⠜⣿⣱⣬⠶⠛⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⣿⣿⠿⠋⠁⠀⠀⠀",
	"⠀⠀⠒⠤⢄⣀⣀⠀⢘⡇⠀⠀⠀⠀⠀⠘⡄⠠⠀⠀⠀⠀⢀⡞⠓⣛⣩⠟⠀⢏⡑⣺⢣⣄⡀⠀⢇⡼⠇⠹⣿⡁⢸⠀⢨⠁⠀⡇⠀⢸⢀⠜⠁⢀⣴⡿⠋⠀⠢⡀⠈⢻⡡⠖⠉⠀⠀⠀⠀⠈⠙⠲⠶⠶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡂⢛⣛⣻⣥⣄⣀⣀⠠⠄",
	"⠀⠀⠀⠀⠀⠀⠈⠱⣔⣇⠀⠀⠀⠀⠀⠀⠘⢄⠁⠂⠠⠀⣾⠀⣾⣻⣗⠉⣵⣛⣼⢏⣾⡼⠗⣁⠀⠀⠠⠐⢈⢿⣾⣄⣸⣀⣠⠥⠔⠊⠁⣀⣴⣿⣿⠃⠀⡠⢄⡅⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣲⣔⣂⠀⠩⠉⣽⣟⣋⣉⣉",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠸⣻⡄⠀⠀⠀⠀⠀⠀⠈⢦⠁⢂⠐⠿⠾⠿⠏⠙⣬⣿⢉⡴⠋⠁⠀⠀⠉⠐⡅⠠⢸⣯⣾⣿⣿⣯⣭⣤⣴⣶⣾⣿⣿⣿⡿⢣⠇⢰⡱⡾⠁⠸⠿⠀⠀⠀⠀⠂⠁⠂⠀⠀⠀⠀⠀⠐⣰⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⡻⣽⣞⡽⠀⠀⣰⣿⣦⡍⠉⠉",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⠳⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⢮⡄⡁⢂⠀⢂⠘⣿⠋⠀⠀⠀⢀⠄⣠⠊⢤⣶⣾⣿⣿⣿⣿⣿⡿⠛⣩⣴⣿⣿⢿⠛⡼⠁⡠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣮⣤⣄⡀⠌⢆⠒⠉⠁⢂⠀⢠⣾⡿⠿⣻⣿⣿⢧⣧⠃⣠⣾⣿⣿⣿⣿⠇⢡",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠄⠂⠀⢤⠀⠀⠀⠀⠀⠀⠀⠀⠈⢾⣿⣦⡡⢌⣂⠌⣧⣀⡀⠀⠄⠈⡐⠁⣀⣾⣿⣿⣿⣿⡟⣹⣃⣤⣼⣿⣿⠻⣍⠶⢋⡠⠊⠒⠉⠀⢀⣀⣀⣀⣀⠀⠀⠀⢀⣠⣴⠧⣄⣠⡿⠛⠛⠿⣿⣷⡄⠸⡀⣀⠜⢹⢀⣿⡟⡥⣿⣦⣿⣿⣿⣿⠿⣿⣵⠢⢌⣽⣏⣉⡈",
	"⠂⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣏⠻⠍⠹⢾⠏⣼⣿⠀⢈⡜⣠⠵⣛⣵⣿⣿⠟⣯⡾⠋⡝⠬⡙⡼⠔⠋⡕⠈⠀⢀⣠⣴⣶⣿⣿⣿⣿⠿⠛⠫⢿⠋⠁⠈⠉⠻⢯⣁⠂⠁⠀⠌⣽⣿⠜⣤⣁⡤⣞⣭⣾⡟⡐⢈⠺⢝⢍⡣⢍⢬⡹⢡⠓⠯⣞⣻⣿⡧⡭",
	"⣿⡠⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀⠽⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢶⣿⠃⡼⠟⠋⠠⠂⢉⡴⢃⣴⣿⣿⣿⣻⣴⡟⠤⢱⣶⣅⠞⠁⡠⠎⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣾⠟⠂⠀⠀⠀⠀⠀⠉⠻⢦⣐⢠⣿⣗⡌⡰⣰⣾⣾⠿⡻⡀⢄⠣⣘⢢⡝⠮⡳⢆⢣⠝⣊⠧⣠⠉⢩⣿⣓",
	"⠀⠀⣄⡔⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠟⠁⡾⢓⡄⠀⠁⢀⡼⣱⣿⣿⡿⣹⣿⣿⣿⣿⡄⢃⡞⢡⠊⠁⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣷⣾⠷⠿⣫⡉⢀⠈⠻⣦⣑⢢⠣⣜⣕⢎⡗⣝⣪⣵⣦⣥⣼⣶⣦⣿",
	"⢐⣢⣼⣶⣤⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣄⣀⠔⠰⡄⠂⣠⠞⣴⣿⣿⡟⢠⣿⣿⣿⣿⣿⠋⢼⠀⡘⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⡠⠀⠀⠀⠀⠀⠀⠀⠐⣄⠀⠀⠀⠙⠿⣷⣌⡀⠁⢜⢤⡀⠡⣈⠚⣧⣱⣷⣹⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷",
	"⠋⢡⠞⠙⢿⡧⣄⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠉⠉⠀⠣⢵⡴⢃⣾⣿⣿⣟⣴⣿⣿⣿⠋⠄⡁⠜⡟⢉⡔⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣄⠀⠀⠀⠈⠛⢿⣿⣶⣷⣽⣷⠾⠿⠿⠟⠛⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
	"⣰⠝⠀⠀⠀⠑⠈⠛⢦⣀⠔⠊⠀⠀⠀⣠⠴⠞⠛⠛⠓⠒⠲⠶⠦⠶⠒⢚⣩⣴⣿⣿⣿⣿⣿⡿⣿⣿⠱⢈⠄⠃⢨⠀⢿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣻⣶⣤⣀⠀⠀⠈⠋⠛⢤⣀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷",
	"⣿⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⣀⠰⢾⣥⣀⣀⣠⣴⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⡍⢰⢱⣿⣧⠃⡌⢸⡀⠈⢄⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣟⣿⣿⣶⣦⣤⣀⣀⣩⣼⣶⣷⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣟",
	"⣿⣇⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠝⡷⣦⣀⠉⠛⢿⣿⣿⣯⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣤⡏⣿⣿⣷⣯⣐⣂⢱⢄⠀⢈⡆⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣽⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣻⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣆⠀⠹⡀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣾⣤⣀⠈⡹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢛⣿⣿⣿⣿⢿⣷⣯⣿⢮⡆⢳⢠⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠷⡏⠀⠉⠺⠯⡻⣯⡒⢄⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢿⣷⣿⣻⣿⣿⡟⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣄⠀⢧⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠉⠛⠿⣶⣦⣌⡹⢻⣿⣿⣿⣿⣿⡟⠁⣠⣾⣿⣿⣿⠏⣾⡿⣿⣿⢢⢙⣹⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣏⡇⠀⠀⠀⠀⠀⠀⠉⠀⢃⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
}
