"""
page, level
"0-1": {
		"name": "Title",
		"image": ,
		"bombs": ["bomb_drop", "bomb_basic"]
	}
	
"11-1": {
		"name": "HD",
		"image": ,
	},"11-2": {
		"name": "Last Crusade",
		"image": ,
	},"11-3": {
		"name": "Witch King",
		"image": ,
	},"11-4": {
		"name": "Headphones",
		"image": ,
	},"11-5": {
		"name": "Cassette",
		"image": ,
	},"11-6": {
		"name": "Laptop",
		"image": ,
	},"11-7": {
		"name": "Github",
		"image": ,
	},"11-8": {
		"name": "Sword & Sheild",
		"image": ,
	},"11-9": {
		"name": "Arcade",
		"image": ,
	},"11-10": {
		"name": "Joystick",
		"image": ,
	},"11-11": {
		"name": "Swiss Knife",
		"image": ,
	},"11-12": {
		"name": "Mario",
		"image": ,
	}
"""
extends Node
var levels: Dictionary = {
	#group 0
	"0-1": {
		"name": "Pixel Plode",
		"image": "res://assets/levels/Group 1/01-001.png",
	},
	"0-2": {
		"name": "Moon and Stars",
		"image": "res://assets/levels/Group 1/01-014.png",
	},
	"0-3": {
		"name": "Sword",
		"image": "res://assets/levels/Group 1/01-003.png",
	},
	"0-4": {
		"name": "Blinky",
		"image":"res://assets/levels/Group 1/01-004.png",
	},
	"0-5": {
		"name": "lightening",
		"image":"res://assets/levels/Group 1/01-005.png",
	},
	"0-6": {
		"name": "Mega Man",
		"image":"res://assets/levels/Group 1/01-006.png",
	},
	"0-7": {
		"name": "Robo Turtle",
		"image":"res://assets/levels/Group 1/01-007.png",
	},
	"0-8": {
		"name": "Mario",
		"image":"res://assets/levels/Group 1/01-008.png",
	},
	"0-9": {
		"name": "Gumba",
		"image":"res://assets/levels/Group 1/01-009.png",
	},
	"0-10": {
		"name": "R2D2",
		"image":"res://assets/levels/Group 1/01-010.png",
	},
	"0-11": {
		"name": "Doggie",
		"image":"res://assets/levels/Group 1/01-011.png",
	},
	"0-12": {
		"name": "Yin Yang",
		"image":"res://assets/levels/Group 1/01-012.png",
	},
	#######################group 1
	"1-1": {
		"name": "Rose",
		"image":"res://assets/levels/Group 2/11.png",
	},
	"1-2": {
		"name": "Potion",
		"image":"res://assets/levels/Group 2/01-015.png",
	},
	"1-3": {
		"name": "The Audacity",
		"image":"res://assets/levels/Group 2/01-016.png",
	},
	"1-4": {
		"name": "Groot",
		"image": "res://assets/levels/Group 2/02-001.png",
	},
	"1-5": {
		"name": "AT-AT",
		"image": "res://assets/levels/Group 2/02-003.png",
	},
	"1-6": {
		"name": "Space Invaders",
		"image": "res://assets/levels/Group 2/02-004.png",
		"bombs": ["bomb_mega"]
	},
	"1-7": {
		"name": "Fish Bowl",
		"image": "res://assets/levels/Group 2/02-006.png",
		"bombs": ["bomb_mega"]
	},
	"1-8": {
		"name": "Batman",
		"image": "res://assets/levels/Group 2/02-007.png",
		"bombs": ["bomb_mega"]
	},
	"1-9": {
		"name": "Laugh Cry",
		"image": "res://assets/levels/Group 2/02-008.png",
		"bombs": ["bomb_mega"]
	},
	"1-10": {
		"name": "Pringle Man",
		"image": "res://assets/levels/Group 2/02-009.png",
		"bombs": ["bomb_mega"]
	},
	"1-11": {
		"name": "Snoop Dog",
		"image": "res://assets/levels/Group 2/02-010.png",
		"bombs": ["bomb_mega"]
	},
	"1-12": {
		"name": "Gondor",
		"image": "res://assets/levels/Group 2/02-013.png",
	},
	######### #group 2
	"2-1": {
		"name": "Gimli",
		"image": "res://assets/levels/Group 3/03-001.png",
	},
	"2-2": {
		"name": "Cool",
		"image": "res://assets/levels/Group 3/03-002.png",
	},
	"2-3": {
		"name": "Falcon",
		"image": "res://assets/levels/Group 3/03-003.png",
	},
	"2-4": {
		"name": "Date",
		"image": "res://assets/levels/Group 3/03-004.png",
	},
	"2-5": {
		"name": "Yoda",
		"image": "res://assets/levels/Group 3/03-005.png",
	},
	"2-6": {
		"name": "Bender",
		"image": "res://assets/levels/Group 3/03-006.png",
	},
	"2-7": {
		"name": "Titanic",
		"image": "res://assets/levels/Group 3/03-007.png",
	},
	"2-8": {
		"name": "Titanic Down",
		"image": "res://assets/levels/Group 3/03-008.png",
	},
	"29": {
		"name": "Circles",
		"image": "res://assets/levels/Group 3/03-009.png",
	},
	"2-10": {
		"name": "Logo",
		"image": "res://assets/levels/Group 3/03-010.png",
	},
	"2-11": {
		"name": "Dolorian",
		"image": "res://assets/levels/Group 3/03-011.png",
	},
	"2-12": {
		"name": "The World",
		"image": "res://assets/levels/Group 3/03-012.png",
	},
	######### #group 3
	"3-1": {
		"name": "Frodo",
		"image": "res://assets/levels/Group 4/02-012.png",
	},
	"3-2": {
		"name": "Fett",
		"image": "res://assets/levels/Group 4/03-006.png",
	},
	"3-3": {
		"name": "X-Wing",
		"image": "res://assets/levels/Group 4/03-008.png",
	},
	"3-4": {
		"name": "Football",
		"image": "res://assets/levels/Group 4/04-003.png",
	},
	"3-5": {
		"name": "Room",
		"image": "res://assets/levels/Group 4/04-005.png",
	},
	"3-6": {
		"name": "Chopper",
		"image": "res://assets/levels/Group 4/04-006.png",
	},
	"3-7": {
		"name": "BTF",
		"image": "res://assets/levels/Group 4/04-008.png",
	},
	"3-8": {
		"name": "Idea",
		"image": "res://assets/levels/Group 4/04-010.png",
	},
	"3-9": {
		"name": "Portrait",
		"image": "res://assets/levels/Group 4/04-012.png",
	},
	"3-10": {
		"name": "Rocky",
		"image": "res://assets/levels/Group 4/05-013.png",
	},
	"3-11": {
		"name": "Casio",
		"image": "res://assets/levels/Group 4/06-002.png",
	},
	"3-12": {
		"name": "Hiker",
		"image": "res://assets/levels/Group 4/06-003.png",
	},
	#### group 5
	"4-1": {
		"name": "Lightsaber",
		"image": "res://assets/levels/Group 5/03-010.png",
	},
	"4-2": {
		"name": "NASA",
		"image": "res://assets/levels/Group 5/03-014.png",
	},
	"4-3": {
		"name": "LEM",
		"image": "res://assets/levels/Group 5/04-013.png",
	},
	"4-4": {
		"name": "Idea 2",
		"image": "res://assets/levels/Group 5/04-014.png",
	},
	"4-5": {
		"name": "Robocop",
		"image": "res://assets/levels/Group 5/04-015.png",
	},
	"4-6": {
		"name": "Window",
		"image": "res://assets/levels/Group 5/04-016.png",
	},
	"4-7": {
		"name": "Samus",
		"image": "res://assets/levels/Group 5/05-006.png",
	},
	"4-8": {
		"name": "Iphone",
		"image": "res://assets/levels/Group 5/05-008.png",
	},
	"4-9": {
		"name": "Nokia",
		"image": "res://assets/levels/Group 5/06-006.png",
	},
	"4-10": {
		"name": "Computer",
		"image": "res://assets/levels/Group 5/06-011.png",
	},
	"4-11": {
		"name": "IPod",
		"image": "res://assets/levels/Group 5/07-003.png",
	},
	"4-12": {
		"name": "Walkman",
		"image": "res://assets/levels/Group 5/07-011.png",
	},
	#### 6
	"5-1": {
		"name": "Gandolf",
		"image": "res://assets/levels/Group 6/03-016.png",
	},
	"5-2": {
		"name": "The Eye",
		"image": "res://assets/levels/Group 6/04-007.png",
	},
	"5-3": {
		"name": "Space Shuttle",
		"image": "res://assets/levels/Group 6/04-009.png",
	},
	"5-4": {
		"name": "Indy",
		"image": "res://assets/levels/Group 6/05-001.png",
	},
	"5-5": {
		"name": "Metroid",
		"image": "res://assets/levels/Group 6/05-002.png",
	},
	"5-6": {
		"name": "Snake",
		"image": "res://assets/levels/Group 6/05-009.png",
	},
	"5-7": {
		"name": "Pocket Watch",
		"image": "res://assets/levels/Group 6/05-010.png",
	},
	"5-8": {
		"name": "Knight",
		"image": "res://assets/levels/Group 6/07-013.png",
	},
	"5-9": {
		"name": "Mailbox",
		"image": "res://assets/levels/Group 6/08-015.png",
	},
	"5-10": {
		"name": "Pigs Fly",
		"image": "res://assets/levels/Group 6/09-014.png",
	},
	"5-11": {
		"name": "Rocket Ship",
		"image": "res://assets/levels/Group 6/10-009.png",
	},
	"5-12": {
		"name": "NES",
		"image": "res://assets/levels/Group 6/nes.png",
	},
	### 7
	"6-1": {
		"name": "Kid Icarus",
		"image": "res://assets/levels/Group 7/07-002.png",
	},"6-2": {
		"name": "USA",
		"image": "res://assets/levels/Group 7/08-008.png",
	},"6-3": {
		"name": "Curcuit",
		"image": "res://assets/levels/Group 7/08-009.png",
	},"6-4": {
		"name": "FINN",
		"image": "res://assets/levels/Group 7/08-010.png",
	},"6-5": {
		"name": "Screen",
		"image": "res://assets/levels/Group 7/08-011.png",
	},"6-6": {
		"name": "Magnet",
		"image": "res://assets/levels/Group 7/08-012.png",
	},"6-7": {
		"name": "Transformer",
		"image": "res://assets/levels/Group 7/08-013.png",
	},"6-8": {
		"name": "LOTR 1",
		"image": "res://assets/levels/Group 7/09-001.png",
	},"6-9": {
		"name": "LOTR 2",
		"image": "res://assets/levels/Group 7/09-002.png",
	},"6-10": {
		"name": "Burger & Fries",
		"image": "res://assets/levels/Group 7/09-003.png",
	},"6-11": {
		"name": "Car",
		"image": "res://assets/levels/Group 7/10-001.png",
	},"6-12": {
		"name": "Sting",
		"image": "res://assets/levels/Group 7/10-007.png",
	},
	### 8
	"7-1": {
		"name": "Contra",
		"image": "res://assets/levels/Group 8/07-012.png",
	},"7-2": {
		"name": "NES",
		"image": "res://assets/levels/Group 8/08-004.png",
	},"7-3": {
		"name": "Stamps",
		"image": "res://assets/levels/Group 8/08-014.png",
	},"7-4": {
		"name": "ET",
		"image": "res://assets/levels/Group 8/09-004.png",
	},"7-5": {
		"name": "Boss",
		"image": "res://assets/levels/Group 8/09-006.png",
	},"7-6": {
		"name": "Bride",
		"image": "res://assets/levels/Group 8/09-007.png",
	},"7-7": {
		"name": "Train",
		"image": "res://assets/levels/Group 8/09-009.png",
	},"7-8": {
		"name": "Rogue",
		"image": "res://assets/levels/Group 8/10-004.png",
	},"7-9": {
		"name": "Controller",
		"image": "res://assets/levels/Group 8/10-005.png",
	},"7-10": {
		"name": "Sting",
		"image": "Icons",
	},"7-11": {
		"name": "Grapes",
		"image": "res://assets/levels/Group 8/graps.png",
	},"7-12": {
		"name": "CLE",
		"image": "res://assets/levels/Group 8/pixelart (1).png",
	},
	### 9
	"8-1": {
		"name": "Jawa",
		"image": "res://assets/levels/Group 9/04-011.png",
	}, "8-2": {
		"name": "Carbonite",
		"image": "res://assets/levels/Group 9/05-003.png",
	}, "8-3": {
		"name": "Wraith",
		"image": "res://assets/levels/Group 9/05-005.png",
	}, "8-4": {
		"name": "NES Controller",
		"image": "res://assets/levels/Group 9/05-007.png",
	}, "8-5": {
		"name": "Catepiller",
		"image": "res://assets/levels/Group 9/05-014.png",
	}, "8-6": {
		"name": "Leaf",
		"image": "res://assets/levels/Group 9/05-015.png",
	}, "8-7": {
		"name": "Luke",
		"image": "res://assets/levels/Group 9/05-016.png",
	}, "8-8": {
		"name": "Office",
		"image": "res://assets/levels/Group 9/06-001.png",
	}, "8-9": {
		"name": "Temple of Doom",
		"image": "res://assets/levels/Group 9/06-007.png",
	}, "8-10": {
		"name": "Olympic",
		"image": "res://assets/levels/Group 9/06-008.png",
	}, "8-11": {
		"name": "Thing",
		"image": "res://assets/levels/Group 9/06-010.png",
	}, 
	###10
	"9-1": {
		"name": "Droids",
		"image": "res://assets/levels/Group 10/07-004.png",
	},"9-2": {
		"name": "Excitebike",
		"image": "res://assets/levels/Group 10/07-015.png",
	}, "9-3": {
		"name": "Stormtrooper",
		"image": "res://assets/levels/Group 10/07-016.png",
	}, "9-4": {
		"name": "Catapult",
		"image": "res://assets/levels/Group 10/08-002.png",
	}, "9-5": {
		"name": "Tower",
		"image": "res://assets/levels/Group 10/08-003.png",
	}, "9-6": {
		"name": "Star Wars",
		"image": "res://assets/levels/Group 10/08-006.png",
	}, "9-7": {
		"name": "Globe",
		"image": "res://assets/levels/Group 10/09-010.png",
	}, "9-8": {
		"name": "Fireplace",
		"image": "res://assets/levels/Group 10/09-016.png",
	}, "9-9": {
		"name": "Old Phone",
		"image": "res://assets/levels/Group 10/10-006.png",
	}, "9-10": {
		"name": "Caution",
		"image": "res://assets/levels/Group 10/10-010.png",
	}, "9-11": {
		"name": "Art",
		"image": "res://assets/levels/Group 10/11-003.png",
	}, "9-12": {
		"name": "Fall Leaf",
		"image": "res://assets/levels/Group 10/11-009.png",
	},
	###11
	"10-1": {
		"name": "HD",
		"image": "res://assets/levels/Group 11/04-001.png",
	},"10-2": {
		"name": "Last Crusade",
		"image": "res://assets/levels/Group 11/06-005.png",
	},"10-3": {
		"name": "Witch King",
		"image": "res://assets/levels/Group 11/06-013.png",
	},"10-4": {
		"name": "Headphones",
		"image": "res://assets/levels/Group 11/06-015.png",
	},"10-5": {
		"name": "Cassette",
		"image": "res://assets/levels/Group 11/06-016.png",
	},"10-6": {
		"name": "Laptop",
		"image": "res://assets/levels/Group 11/07-006.png",
	},"10-7": {
		"name": "Github",
		"image": "res://assets/levels/Group 11/07-007.png",
	},"10-8": {
		"name": "Sword & Sheild",
		"image": "res://assets/levels/Group 11/07-008.png",
	},"10-9": {
		"name": "Arcade",
		"image": "res://assets/levels/Group 11/08-001.png",
	},"10-10": {
		"name": "Joystick",
		"image": "res://assets/levels/Group 11/09-013.png",
	},"10-11": {
		"name": "Swiss Knife",
		"image": "res://assets/levels/Group 11/10-008.png",
	},"10-12": {
		"name": "Mario",
		"image": "res://assets/levels/Group 11/11-001.png",
	},
	#12
	"11-1": {
		"name": "More Indy",
		"image": "res://assets/levels/Group 12/06-009.png",
	},"11-2": {
		"name": "McFly",
		"image": "res://assets/levels/Group 12/06-014.png",
	},"11-3": {
		"name": "Ohio",
		"image": "res://assets/levels/Group 12/07-010.png",
	},"11-4": {
		"name": "Lincoln",
		"image": "res://assets/levels/Group 12/07-014.png",
	},"11-5": {
		"name": "Darkside",
		"image": "res://assets/levels/Group 12/08-016.png",
	},"11-6": {
		"name": "Vertigo",
		"image": "res://assets/levels/Group 12/10-002.png",
	},"11-7": {
		"name": "Duck Hunt",
		"image": "res://assets/levels/Group 12/10-012.png",
	},"11-8": {
		"name": "Big Chopper",
		"image": "res://assets/levels/Group 12/10-016.png",
	},"11-9": {
		"name": "Avitar",
		"image": "res://assets/levels/Group 12/11-008.png",
	},"11-10": {
		"name": "Portrait",
		"image": "res://assets/levels/Group 12/11-013.png",
	},"11-11": {
		"name": "Sonic",
		"image": "res://assets/levels/Group 12/11-016.png",
	},"11-12": {
		"name": "Ghost Busters",
		"image": "res://assets/levels/Group 12/gb.png",
	},
	#13
	"12-1": {
		"name": "SW",
		"image": "res://assets/levels/Group 13/06-012.png",
	},"12-2": {
		"name": "Pac Man",
		"image": "res://assets/levels/Group 13/08-005.png",
	},"12-3": {
		"name": "Atari Logo",
		"image": "res://assets/levels/Group 13/09-008.png",
	},"12-4": {
		"name": "Raiders",
		"image": "res://assets/levels/Group 13/09-011.png",
	},"12-5": {
		"name": "Helicopter",
		"image": "res://assets/levels/Group 13/09-015.png",
	},"12-6": {
		"name": "Butterfly",
		"image": "res://assets/levels/Group 13/10-014.png",
	},"12-7": {
		"name": "Episode 7",
		"image": "res://assets/levels/Group 13/11-002.png",
	},"12-8": {
		"name": "Atari",
		"image": "res://assets/levels/Group 13/11-004.png",
	},"12-9": {
		"name": "Jets",
		"image": "res://assets/levels/Group 13/11-005.png",
	},"12-10": {
		"name": "Cavelairs",
		"image": "res://assets/levels/Group 13/11-007.png",
	},"12-11": {
		"name": "Campfire",
		"image": "res://assets/levels/Group 13/11-011.png",
	},"12-12": {
		"name": "Bulldog",
		"image": "res://assets/levels/Group 13/bulldog.png",
	},
	#14
	"13-1": {
		"name": "Mother Brain",
		"image": "res://assets/levels/Group 14/06-004.png",
	},"13-2": {
		"name": "Rebels",
		"image": "res://assets/levels/Group 14/09-012.png",
	},"13-3": {
		"name": "Kill Bill",
		"image": "res://assets/levels/Group 14/10-003.png",
	},"13-4": {
		"name": "Stars & Stripes",
		"image": "res://assets/levels/Group 14/10-013.png",
	},"13-5": {
		"name": "Fan",
		"image": "res://assets/levels/Group 14/11-006.png",
	},"13-6": {
		"name": "Iso Building",
		"image": "res://assets/levels/Group 14/11-010.png",
	},"13-7": {
		"name": "R2-D2 2",
		"image": "res://assets/levels/Group 14/11-012.png",
	},"13-8": {
		"name": "Ace of Spades",
		"image": "res://assets/levels/Group 14/11-014.png",
	},"13-9": {
		"name": "Phone Home",
		"image": "res://assets/levels/Group 14/11-015.png",
	},"13-10": {
		"name": "Bazooka",
		"image": "res://assets/levels/Group 14/advwar.png",
	},"13-11": {
		"name": "Do the Dew",
		"image": "res://assets/levels/Group 14/dewart.png",
	},"13-12": {
		"name": "Link",
		"image": "res://assets/levels/Group 14/link.png",
	},
	#15
	"14-1": {
		"name": "Liberty",
		"image": "res://assets/levels/Group 15/07-009.png",
	},"14-2": {
		"name": "Camping",
		"image": "res://assets/levels/Group 15/10-015.png",
	},"14-3": {
		"name": "Metroid Battle",
		"image": "res://assets/levels/Group 15/371.png",
	},"14-4": {
		"name": "Bionic Camando",
		"image": "res://assets/levels/Group 15/1673.png",
	},"14-5": {
		"name": "Chozo",
		"image": "res://assets/levels/Group 15/1781.png",
	},"14-6": {
		"name": "Joe",
		"image": "res://assets/levels/Group 15/32930.png",
	},"14-7": {
		"name": "Bionic Joi",
		"image": "res://assets/levels/Group 15/bcomm-nes_raddspencer_levelover.png",
	},"14-8": {
		"name": "Treasure Chest",
		"image": "res://assets/levels/Group 15/chest.png",
	},"14-9": {
		"name": "Photos",
		"image": "res://assets/levels/Group 15/Google Photos.png",
	},"14-10": {
		"name": "Samos",
		"image": "res://assets/levels/Group 15/ihx4c0cvpfu61.png",
	},"14-11": {
		"name": "Pixel Dog",
		"image": "res://assets/levels/Group 15/PixelDog.png",
	},"14-12": {
		"name": "Mega Man II",
		"image": "res://assets/levels/Group 15/mega_pose.png",
	}
}
