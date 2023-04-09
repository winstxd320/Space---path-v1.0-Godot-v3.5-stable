extends Node2D

onready var sonido = $AudioStreamPlayer
onready var tiempo = $Timer
onready var sonidofondo = $"sonido intro"

func _ready():
	sonidofondo.play()

func cambiarEscena():
	
	get_tree().change_scene("res://main.tscn")
	VariablesGlobales.vida = 5
	print("Ruta actual de la escena :" + VariablesGlobales.RutaNivelActual)

func CambiarEscena2():
	get_tree().change_scene("res://creditos.tscn")
	
	sonidofondo.stop()
func _on_Jugar_pressed():
	sonido.play()
	cambiarEscena()
	
func _on_Salir_pressed():
	get_tree().quit()


func _on_boton_como_jugar_pressed():
	CambiarEscena2()
	sonidofondo.stop()
