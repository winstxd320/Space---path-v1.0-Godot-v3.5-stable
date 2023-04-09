extends Node2D

onready var TextoVida = $Vida
var Distancia = 750
var Contador = 0
onready var TextoDistancia = $Distacia
onready var musica = $AudioStreamPlayer

func _ready():
	musica.play()

func ContadorDistancia():
	if Contador > 10:
		Distancia -= 1
		Contador = 0
	TextoDistancia.text = str(Distancia) + " m"
func Ganar():
	if Distancia == 0:
		get_tree().change_scene("res://Ganastes.tscn")
		VariablesGlobales.RutaNivelGanador = VariablesGlobales.Rutas2[1]
		VariablesGlobales.RutaNivelActual = VariablesGlobales.Rutas2[1]
		VariablesGlobales.vida = 5
		VariablesGlobales.Puntos = 0

func _process(delta):
	Contador += 1
	ContadorDistancia()
	Ganar()
	TextoVida.text = str(VariablesGlobales.vida)

