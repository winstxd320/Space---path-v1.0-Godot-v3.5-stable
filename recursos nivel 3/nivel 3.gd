extends Node2D

onready var TextoVida = $"jugador nivel 3/Vidas"
onready var TextoPunto = $"jugador nivel 3/Puntos"
onready var Texto = $Aviso/letras
onready var musica = $AudioStreamPlayer

onready var Aviso = $Aviso
func _ready():
	musica.play()
	
func _process(delta):
	TextoVida.text = "x " + str(VariablesGlobales.vida)
	TextoPunto.text = "x " + str(VariablesGlobales.Puntos)
	
	if VariablesGlobales.Puntos > 4:
		Texto.hide()
		Aviso.hide()
		
func _on_Bandera_Ganar_body_entered(body):
	if body is JugadorNivel3:
		get_tree().change_scene("res://Escena final/escena final.tscn")

func _on_Aviso_body_entered(body):
	if body is JugadorNivel3:
		Texto.show()

func _on_Aviso_body_exited(body):
	if body is JugadorNivel3:
		Texto.hide()

