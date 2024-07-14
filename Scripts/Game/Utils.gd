class_name Utils
extends Node

func _ready():
	randomize();


static func throw_die():
	return (randi() % 6) + 1;
