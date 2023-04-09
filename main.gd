extends Node2D

var vida = VariablesGlobales.vida
var contSeg = 0
var segundos = 0
var minutos = 0
var puntos = 0
onready var TiempoTexto = $Cronometro
onready var TiempoTextoMin = $"Tiempo 2"
onready var musica = $AudioStreamPlayer
func _ready():
	musica.play()
func _process(delta):
	
	TiempoTexto.text = str(segundos)
	TiempoTextoMin.text = str(minutos)
	
	contSeg = contSeg + 1
	if contSeg > 30:
		contSeg = 0
		segundos = segundos + 1
	
	if segundos > 59:
		minutos = minutos + 1
		segundos = 0
		

