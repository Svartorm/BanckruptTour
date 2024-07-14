class_name Player
extends Node2D

var player_name: String;
var money: int;
var properties: Array[Property];
var board_index: int;

func _init(name, money = 100, properties: Array[Property] = [], index = 0):
	self.player_name = name;
	self.money = money;
	self.properties = properties;
	self.board_index = index;


### Methods ###

func buy(property: Property):
	if property.landlord != null:
		printerr("Player: buy: " + player_name + " can't buy " + property.property_name + "! Already Have Landlord");
		return false;
	
	if money < property.cost():
		printerr("Player: buy: " + player_name + " can't buy " + property.property_name + "! Not Enough Money");
		return false;
	
	# Make the sell
	money -= property.cost();
	properties.append(property);
	property.landlord = self;
	
	return true;

func upgrade(property: Property):
	var cost = property.upgrade_cost();
	if cost < 0 or money < cost:
		printerr("Player: upgrade:" + player_name + " cannot upgrade " + property.property_name + "!");
		return false;
	
	# Upgrade the property
	money -= cost;
	property.level += 1;
	
	return true;



