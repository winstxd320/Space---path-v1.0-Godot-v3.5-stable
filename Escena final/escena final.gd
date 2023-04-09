extends Node2D

onready var musica_final = $AudioStreamPlayer

func _ready():
	musica_final.play()


func _on_boton_pressed():
	get_tree().change_scene("res://menu.tscn")
