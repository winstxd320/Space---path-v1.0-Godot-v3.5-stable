extends Node2D

func CambiarEscena():
	get_tree().change_scene("res://menu.tscn")

func _on_boton_atras_pressed():
	CambiarEscena()
