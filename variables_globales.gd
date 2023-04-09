extends Node
var Rutas = ["res://main.tscn", "res://recursos nivel 2/nivel 2.tscn"]
var Rutas2 = ["res://recursos nivel 2/nivel 2.tscn", "res://recursos nivel 3/nivel 3.tscn"]
var vida = 5 
var velocidad = 200
var RutaNivelActual: String
var RutaNivelGanador: String
var Puntos = 0
func CambiarEscena(escena):
	get_tree().change_scene(escena)

