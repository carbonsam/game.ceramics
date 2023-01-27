extends Node

const BARRIER_COORDS = Vector2i(4, 2)
const INVISIBLE_BARRIER_COORDS = Vector2i(5, 2)

@onready var _ground = $GameWorld/GroundTiles

func _ready():
	var barriers = _ground.get_used_cells_by_id(0, 0, BARRIER_COORDS)
	
	for cell in barriers:
		_ground.set_cell(0, cell, 0, INVISIBLE_BARRIER_COORDS)
