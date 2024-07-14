extends Node2D

@export var ADDRESS = "127.0.0.1";
@export var PORT = 999;
@export var NB_MAX_PLAYER = 4;

var peer: ENetMultiplayerPeer;

@export var player_scene: PackedScene;

func _ready():
	multiplayer.peer_connected.connect(peer_connected);
	multiplayer.peer_disconnected.connect(peer_disconnected);
	multiplayer.connected_to_server.connect(connected_to_server);
	multiplayer.connection_failed.connect(connection_failed);

# This is called on Server + Clients
func peer_connected(id):
	print("Player Connected: " + str(id));
	add_player(id);

# This is called on Server + Clients
func peer_disconnected(id):
	print("Player Disconnected: " + str(id));
	get_node(str(id)).queue_free();

# This is called on Clients
func connected_to_server():
	print("You have successfully connected to server");

# This is called on Clients
func connection_failed():
	printerr("Failed to connect to server");


### Buttons ###
func _on_host_btn_pressed():
	peer = ENetMultiplayerPeer.new();
	
	if peer.create_server(PORT, NB_MAX_PLAYER) != OK:
		printerr("Failed to create server on port: " + str(PORT));
		return;
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER);
	multiplayer.set_multiplayer_peer(peer);
	multiplayer.server_relay = true;
	
	add_player();
	
	print("Waiting for players ...");

func _on_join_btn_pressed():
	peer = ENetMultiplayerPeer.new();
	
	if peer.create_client(ADDRESS, PORT) != OK:
		printerr("Couldn't connect to host: " + ADDRESS + ":" + str(PORT));
		return;
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER);
	multiplayer.set_multiplayer_peer(peer);
	
	print("Client created successfully!");


### Utils ###

func add_player(id = 1):
	print("Creating player scene: " + str(id));
	var player = player_scene.instantiate();
	player.name = str(id);
	call_deferred("add_child", player);
