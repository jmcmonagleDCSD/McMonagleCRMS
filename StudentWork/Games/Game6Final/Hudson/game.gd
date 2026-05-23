extends Node2D

@onready var players = {
	"1": {
		viewport = $HBoxContainer/SubViewportContainer,
		camera = $HBoxContainer/SubViewportContainer/SubViewport/Camera2D,
		player_node = $HBoxContainer/SubViewportContainer/SubViewport/Track/Player
	},
	"2": {
		viewport = $HBoxContainer/SubViewportContainer2,
		camera = $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D,
		player_node = $HBoxContainer/SubViewportContainer/SubViewport/Track/Player2
	}
}
# Called when the node enters the scene tree for the first time.
func _ready():
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	for player in players.values():
		var remote_transform = RemoteTransform2D.new()
		remote_transform.remote_path = player.camera.get_path()
		player.player_node.add_child(remote_transform)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
