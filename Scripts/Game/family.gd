class_name Family

var id: int;
var properties: Array[Property];

func _init(id, props = []):
	self.id = id;
	self.properties = props;


### Methods ###

func hasMonopoly():
	if properties.size() == 0:
		return false;
	
	var ref_player: Player = properties[0].landlord;
	for property in properties:
		if property.landlord != ref_player:
			return false;
	return true;
