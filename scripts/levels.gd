"""
page, level
"01": {
		"name": "Title",
		"image": ,
		"bombs": ["bomb_drop", "bomb_basic"]
	}
	

"""
extends Node
var levels: Dictionary = {
	#group 0
	"01": {
		"name": "Pixel Plode",
		"image": "res://assets/levels/Group 1/01-001.png",
	},
	"02": {
		"name": "Moon and Stars",
		"image": "res://assets/levels/Group 1/01-014.png",
	},
	"03": {
		"name": "Sword",
		"image": "res://assets/levels/Group 1/01-003.png",
	},
	"04": {
		"name": "Blinky",
		"image":"res://assets/levels/Group 1/01-004.png",
	},
	"05": {
		"name": "lightening",
		"image":"res://assets/levels/Group 1/01-005.png",
	},
	"06": {
		"name": "Mega Man",
		"image":"res://assets/levels/Group 1/01-006.png",
	},
	"07": {
		"name": "Robo Turtle",
		"image":"res://assets/levels/Group 1/01-007.png",
	},
	"08": {
		"name": "Mario",
		"image":"res://assets/levels/Group 1/01-008.png",
	},
	"09": {
		"name": "Gumba",
		"image":"res://assets/levels/Group 1/01-009.png",
	},
	"010": {
		"name": "R2D2",
		"image":"res://assets/levels/Group 1/01-010.png",
	},
	"011": {
		"name": "Doggie",
		"image":"res://assets/levels/Group 1/01-011.png",
	},
	"012": {
		"name": "Yin Yang",
		"image":"res://assets/levels/Group 1/01-012.png",
	},
	#######################group 1
	"11": {
		"name": "Rose",
		"image":"res://assets/levels/Group 2/11.png",
	},
	"12": {
		"name": "Potion",
		"image":"res://assets/levels/Group 2/01-015.png",
	},
	"13": {
		"name": "The Audacity",
		"image":"res://assets/levels/Group 2/01-016.png",
	},
	"14": {
		"name": "Groot",
		"image": "res://assets/levels/Group 2/02-001.png",
	},
	"15": {
		"name": "AT-AT",
		"image": "res://assets/levels/Group 2/02-003.png",
	},
	"16": {
		"name": "Space Invaders",
		"image": "res://assets/levels/Group 2/02-004.png",
		"bombs": ["bomb_mega"]
	},
	"17": {
		"name": "Fish Bowl",
		"image": "res://assets/levels/Group 2/02-006.png",
		"bombs": ["bomb_mega"]
	},
	"18": {
		"name": "Batman",
		"image": "res://assets/levels/Group 2/02-007.png",
		"bombs": ["bomb_mega"]
	},
	"19": {
		"name": "Laugh Cry",
		"image": "res://assets/levels/Group 2/02-008.png",
		"bombs": ["bomb_mega"]
	},
	"110": {
		"name": "Pringle Man",
		"image": "res://assets/levels/Group 2/02-009.png",
		"bombs": ["bomb_mega"]
	},
	"111": {
		"name": "Snoop Dog",
		"image": "res://assets/levels/Group 2/02-010.png",
		"bombs": ["bomb_mega"]
	},
	"112": {
		"name": "Gondor",
		"image": "res://assets/levels/Group 2/02-013.png",
	},
	######### #group 2
	"21": {
		"name": "Gimli",
		"image": "res://assets/levels/Group 3/03-001.png",
	},
	"22": {
		"name": "Cool",
		"image": "res://assets/levels/Group 3/03-002.png",
	},
	"23": {
		"name": "Falcon",
		"image": "res://assets/levels/Group 3/03-003.png",
	},
	"24": {
		"name": "Date",
		"image": "res://assets/levels/Group 3/03-004.png",
	},
	"25": {
		"name": "Yoda",
		"image": "res://assets/levels/Group 3/03-005.png",
	},
	"26": {
		"name": "Bender",
		"image": "res://assets/levels/Group 3/03-006.png",
	},
	"27": {
		"name": "Titanic",
		"image": "res://assets/levels/Group 3/03-007.png",
	},
	"28": {
		"name": "Titanic Down",
		"image": "res://assets/levels/Group 3/03-008.png",
	},
	"29": {
		"name": "Circles",
		"image": "res://assets/levels/Group 3/03-009.png",
	},
	"210": {
		"name": "Logo",
		"image": "res://assets/levels/Group 3/03-010.png",
	},
	"211": {
		"name": "Dolorian",
		"image": "res://assets/levels/Group 3/03-011.png",
	},
	"212": {
		"name": "The World",
		"image": "res://assets/levels/Group 3/03-012.png",
	},
	######### #group 3
	"31": {
		"name": "Frodo",
		"image": "res://assets/levels/Group 4/02-012.png",
	},
	"32": {
		"name": "Fett",
		"image": "res://assets/levels/Group 4/03-006.png",
	},
	"33": {
		"name": "X-Wing",
		"image": "res://assets/levels/Group 4/03-008.png",
	},
	"34": {
		"name": "Football",
		"image": "res://assets/levels/Group 4/04-003.png",
	},
	"35": {
		"name": "Room",
		"image": "res://assets/levels/Group 4/04-005.png",
	},
	"36": {
		"name": "Chopper",
		"image": "res://assets/levels/Group 4/04-006.png",
	},
	"37": {
		"name": "BTF",
		"image": "res://assets/levels/Group 4/04-008.png",
	},
	"38": {
		"name": "Idea",
		"image": "res://assets/levels/Group 4/04-010.png",
	},
	"39": {
		"name": "Portrait",
		"image": "res://assets/levels/Group 4/04-012.png",
	},
	"310": {
		"name": "Rocky",
		"image": "res://assets/levels/Group 4/05-013.png",
	},
	"311": {
		"name": "Casio",
		"image": "res://assets/levels/Group 4/06-002.png",
	},
	"312": {
		"name": "Hiker",
		"image": "res://assets/levels/Group 4/06-003.png",
	},
	#### group 5
	"41": {
		"name": "Lightsaber",
		"image": "res://assets/levels/Group 5/03-010.png",
	},
	"42": {
		"name": "NASA",
		"image": "res://assets/levels/Group 5/03-014.png",
	},
	"43": {
		"name": "LEM",
		"image": "res://assets/levels/Group 5/04-013.png",
	},
	"44": {
		"name": "Idea 2",
		"image": "res://assets/levels/Group 5/04-014.png",
	},
	"45": {
		"name": "Robocop",
		"image": "res://assets/levels/Group 5/04-015.png",
	},
	"46": {
		"name": "Window",
		"image": "res://assets/levels/Group 5/04-016.png",
	},
	"47": {
		"name": "Samus",
		"image": "res://assets/levels/Group 5/05-006.png",
	},
	"48": {
		"name": "Iphone",
		"image": "res://assets/levels/Group 5/05-008.png",
	},
	"49": {
		"name": "Nokia",
		"image": "res://assets/levels/Group 5/06-006.png",
	},
	"410": {
		"name": "Computer",
		"image": "res://assets/levels/Group 5/06-011.png",
	},
	"411": {
		"name": "IPod",
		"image": "res://assets/levels/Group 5/07-003.png",
	},
	"412": {
		"name": "Walkman",
		"image": "res://assets/levels/Group 5/07-011.png",
	},
	#### 6
	"51": {
		"name": "Gandolf",
		"image": "res://assets/levels/Group 6/03-016.png",
	},
	"52": {
		"name": "The Eye",
		"image": "res://assets/levels/Group 6/04-007.png",
	},
	"53": {
		"name": "Space Shuttle",
		"image": "res://assets/levels/Group 6/04-009.png",
	},
	"54": {
		"name": "Indy",
		"image": "res://assets/levels/Group 6/05-001.png",
	},
	"55": {
		"name": "Metroid",
		"image": "res://assets/levels/Group 6/05-002.png",
	},
	"56": {
		"name": "Snake",
		"image": "res://assets/levels/Group 6/05-009.png",
	},
	"57": {
		"name": "Pocket Watch",
		"image": "res://assets/levels/Group 6/05-010.png",
	},
	"58": {
		"name": "Knight",
		"image": "res://assets/levels/Group 6/07-013.png",
	},
	"59": {
		"name": "Mailbox",
		"image": "res://assets/levels/Group 6/08-015.png",
	},
	"510": {
		"name": "Pigs Fly",
		"image": "res://assets/levels/Group 6/09-014.png",
	},
	"511": {
		"name": "Rocket Ship",
		"image": "res://assets/levels/Group 6/10-009.png",
	},
	"512": {
		"name": "NES",
		"image": "res://assets/levels/Group 6/nes.png",
	}
}
