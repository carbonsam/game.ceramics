extends Node

const BARRIER_ID = 1
const INVISIBLE_BARRIER = 2

@onready var _ground = $GameWorld/GroundTiles

func _ready():
	var barriers = _ground.get_used_cells_by_id(0, 0, Vector2i(4, 2))
	
	for cell in barriers:
		_ground.set_cell(0, Vector2i(5, 2))
