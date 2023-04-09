extends Node2D

onready var sonido = $AudioStreamPlayer

func _ready():
	sonido.play()
	
func _on_TextureButton_pressed():
	VariablesGlobales.CambiarEscena(VariablesGlobales.RutaNivelActual)
	sonido.stop()
	VariablesGlobales.Puntos = 0
	
