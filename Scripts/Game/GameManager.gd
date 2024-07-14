extends Node2D

var player_list: Array[Player];
var board: Array[Property];

func _ready():
	player_list = [];
	board = [];
	
	player_list.append(Player.new("playerone"));
	player_list.append(Player.new("playertwo"));
	
	board.append(Property.new("streetone", [10, 20, 30]));
	board.append(Property.new("streettwo", [10, 20, 30]));
	board.append(Property.new("streetthree", [10, 20, 30]));
	board.append(Property.new("streetfour", [10, 20, 30]));
	
	player_list[0].buy(board[0]);
	player_list[1].buy(board[0]);
	
	for player in player_list:
		player.display();
	
	move_player(player_list[0]);

func move_player(player: Player):
	var die_one = Utils.throw_die();
	var die_two = Utils.throw_die();
	var double = die_one == die_two;
	
	print("Moving ", player.player_name, " to ", player.board_index + die_one + die_two, " (", die_one, ", ", die_two, ")");
	
	player.board_index = (player.board_index + die_one + die_two) 


func _on_dice_btn_pressed():
	var die_one = Utils.throw_die();
	var die_two = Utils.throw_die();
	
	$DieOne.text = str(die_one);
	$DieTwo.text = str(die_two);
