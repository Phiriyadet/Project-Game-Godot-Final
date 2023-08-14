#upgradeDb
extends Node
const ITEM_PATH = "res://Assets/ResizeTexture/Items/"
const SKILL_PATH = "res://Assets/ResizeTexture/Skills/"
const WEAPON_PATH = "res://Assets/ResizeTexture/Weapons/"
const UPGRADE_SCENES : Dictionary = {
	"BonkBat":preload("res://Weapons/BonkBat/BonkBat.tscn"),
	"BonkMissile":preload("res://Weapons/BonkMissile/BonkMissile.tscn"),
	"GunHand":preload("res://Weapons/GunHand/GunHand.tscn"),
	"Nokia3310":preload("res://Weapons/Nokia3310/Nokia3310.tscn"),
	"Punch":preload("res://Weapons/Punch/Punch.tscn"),
	"TwoGuitars":preload("res://Weapons/TwoGuitars/TwoGuitars.tscn"),
	"Ameno":preload("res://Skills/Ameno/Ameno.tscn"),
	"Family":preload("res://Skills/Family/Family.tscn"),
	"Gigachad":preload("res://Skills/Gigachad/Gigachad.tscn"),
	"GottaGoFast":preload("res://Skills/GottaGoFast/GottaGoFast.tscn"),
	"Rickroll":preload("res://Skills/Rickroll/Rickroll.tscn"),
	"ThisIsFine":preload("res://Skills/ThisIsFine/ThisIsFine.tscn"),
	"Amogus":preload("res://Items/Amogus/Amogus.tscn"),
	"NanomachinesSon":preload("res://Items/NanomachinesSon/NanomachinesSon.tscn"),
	"SuezCanalJam":preload("res://Items/SuezCanalJam/SuezCanalJam.tscn"),
	"TakeMyMoney":preload("res://Items/ThePumpkinDance/ThePumpkinDance.tscn"),
	"TheMotivation":preload("res://Items/TheMotivation/TheMotivation.tscn"),
	"ThePumpkinDance":preload("res://Items/ThePumpkinDance/ThePumpkinDance.tscn"),
}


var UPGRADES = {
	
	"BonkBat":{
		"icon": WEAPON_PATH + "bat.png",
		"displayname": "Bonk Bat",
		"details": "Bonk Bat have ",
		"level": 1,
		"type": "weapon"
	},
	"BonkMissile":{
		"icon": WEAPON_PATH + "bonk_missile.png",
		"displayname": "Bonk Missile",
		"details": "Bonk Missile have ",
		"level": 1,
		"type": "weapon"
	},
	"GunHand":{
		"icon": WEAPON_PATH + "gunhand.png",
		"displayname": "Gun Hand",
		"details": "Gun Hand have ",
		"level": 1,
		"type": "weapon"
	},
	"Nokia3310":{
		"icon": WEAPON_PATH + "indestructible_nokia3310.png",
		"displayname": "Nokia3310",
		"details": "Nokia3310 have ",
		"level": 1,
		"type": "weapon"
	},
	"Punch":{
		"icon": WEAPON_PATH + "punch.png",
		"displayname": "Punch",
		"details": "Punch have ",
		"level": 1,
		"type": "weapon"
	},
	"TwoGuitars":{
		"icon": WEAPON_PATH + "two_guitars.png",
		"displayname": "Two Guitars",
		"details": "Two Guitars have ",
		"level": 1,
		"type": "weapon"
	},
	#skills
	"Ameno":{
		"icon": SKILL_PATH + "ameno.png",
		"displayname": "Ameno",
		"details": "เพิ่ม Pickup Radius ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},
	"Family":{
		"icon": SKILL_PATH + "family.png",
		"displayname": "Family",
		"details": "เพิ่ม Max HP ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},
	"Gigachad":{
		"icon": SKILL_PATH + "gigachad.png",
		"displayname": "Gigachad",
		"details": "ทุก 7 วินาทีฟื้นฟู HP ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},
	"GottaGoFast": {
		"icon": SKILL_PATH + "gotta_go_fast.png",
		"displayname": "Gotta Go Fast",
		"details": "เพิ่ม SPD ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},
	"Rickroll": {
		"icon": SKILL_PATH + "rickroll.png",
		"displayname": "Rickroll",
		"details": "เมื่อพลังชีวิตน้อยกว่าครึ่งเพิ่ม SPD ATK และ Pickup Radius ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},
	"ThisIsFine": {
		"icon": SKILL_PATH + "this_is_fine.png",
		"displayname": "This Is Fine",
		"details": "เพิ่ม ATK ตามเลเวลสกิล",
		"level": 1,
		"type": "skill"
	},

	"Amogus": {
		"icon": ITEM_PATH + "amogus.png",
		"displayname": "Amogus",
		"details": "เพิ่มค่า EXP ที่เก็บได้ขึ้นตามเลเวล",
		"level": 1,
		"type": "item"
	},
	"NanomachinesSon": {
		"icon": ITEM_PATH + "hearth_nms.png",
		"displayname": "Nanomachines Son",
		"details": "ตัวละครจะไม่ได้รับความเสียหายเป็นเวลา 10 วินาที เวลาคูลดาวน์ ตามเลเวล (วินาที)",
		"level": 1,
		"type": "item"
	},
	"SuezCanalJam": {
		"icon": ITEM_PATH + "evergreen.png",
		"displayname": "Suez Canal Jam",
		"details": "สร้างการป้องกันขึ้นด้านหลังของตัวละคร เวลาคูลดาวน์ 5 วินาทีและจะคงอยู่นานตามเลเวล (วินาที)",
		"level": 1,
		"type": "item"
	},
	"TakeMyMoney": {
		"icon": ITEM_PATH + "takemymoney.png",
		"displayname": "Take My Money",
		"details": "เพิ่มโบนัสเงินเมื่อเล่นจบเพิ่มโบนัสตามเลเวล",
		"level": 1,
		"type": "item"
	},
	"TheMotivation": {
		"icon": ITEM_PATH + "chair.png",
		"displayname": "The Motivation",
		"details": "สร้างอาณาเขตรอบ ๆ ตัวละคร ทำให้ SPD ของศัตรูลดลงตามเลเวล",
		"level": 1,
		"type": "item"
	},
	"ThePumpkinDance": {
		"icon": ITEM_PATH + "pumpkin_dance.png",
		"displayname": "The Pumpkin Dance",
		"details": "ปรากฏตัวออกมาช่วยเก็บ EXP เวลาคูลดาวน์ 15 วินาที เวลาคงอยู่ตามเลเวล(วินาที)",
		"level": 1,
		"type": "item"
	},
}

