extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GUI/Health.value = Global.health
	$GUI/Score.set_text(str(" Score: ", Global.score))
	
	if $Coins.get_child_count() == 0:
		get_tree().change_scene_to_file("res://win.tscn")

