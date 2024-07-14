class_name Property
extends Node2D

var property_name: String;
var prices: PackedInt32Array; # Array of int
var family: Family;
var landlord: Player;
var level: int;
var upgrade_prices: PackedInt32Array;

func _init(pname, prices = [], family = null, landlord = null, level = 0, upgrade_prices = []):
	self.property_name = pname;
	self.prices = prices;
	self.family = family;
	self.landlord = landlord;
	self.level = level;
	self.upgrade_prices = upgrade_prices;


### Methods ###

func display():
	print("----");
	print("Name: " + property_name);
	#print("Family number: ", family.id);
	print("Landlord: ", "none" if landlord == null else landlord.player_name);
	print("Level: ", level);
	print("Prices: ", prices);
	print("Upgrades: ", upgrade_prices);
	return;

func cost():
	return prices[level];

func upgrade_cost():
	if level >= prices.size() - 1:
		return -1;
	return upgrade_prices[level];
