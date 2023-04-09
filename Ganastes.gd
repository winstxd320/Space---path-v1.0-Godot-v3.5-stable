extends Node2D


func CambiarEscena(escena: String) -> void:
	get_tree().change_scene(escena)

func _on_TextureButton_pressed():
	CambiarEscena(VariablesGlobales.RutaNivelGanador)
	

