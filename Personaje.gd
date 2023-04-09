extends KinematicBody2D
class_name Personaje

var velocidad = 200
var puntos = 0

onready var personaje = $Sprite
onready var moneda = get_parent().find_node("ObjetoPunto")
onready var TextoPuntos = get_parent().find_node("Contador Puntos")
onready var SonidoMoneda = $"Sonido Moneda"
onready var meteoro1 = get_parent().find_node("Meteoro")
onready var meteoro2 = get_parent().find_node("Meteoro2")
onready var meteoro3 = get_parent().find_node("Meteoro3")
onready var meteoro4 = get_parent().find_node("Meteoro4")
onready var meteoro5 = get_parent().find_node("Meteoro5")
onready var meteoro6 = get_parent().find_node("Meteoro6")
onready var meteoro7 = get_parent().find_node("Meteoro7")
onready var sonidogolpe = get_parent().find_node("golpe")
func SumarPuntos():
	puntos = puntos + 1
	if puntos > 4:
		VariablesGlobales.RutaNivelActual = VariablesGlobales.Rutas[1]
		get_tree().change_scene("res://Ganastes.tscn")
		VariablesGlobales.RutaNivelGanador = VariablesGlobales.Rutas2[0]
		print()
		print("La ruta se cambio a: " + VariablesGlobales.RutaNivelActual)
		VariablesGlobales.vida = 5
		VariablesGlobales.Puntos = 0
func RepSonidoMoneda():
	SonidoMoneda.play()

func _process(delta):
	TextoPuntos.text = str(puntos)

func _physics_process(delta):
	
	var direccion = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up") and direccion.x == 0:
		direccion.y = -velocidad
		personaje.play("arriba")
	if Input.is_action_pressed("ui_down") and direccion.x == 0:
		direccion.y = velocidad 	
		personaje.play("abajo")
	if Input.is_action_pressed("ui_right") and direccion.y == 0:
		direccion.x = velocidad
		personaje.play("derecha")
	if Input.is_action_pressed("ui_left") and direccion.y == 0:
		direccion.x = -velocidad
		personaje.play("izquierda")
	var movimiento = direccion *  delta
	
	var colision = move_and_collide(movimiento)
	
	if VariablesGlobales.vida == 0:
		
		get_tree().change_scene("res://partida perdida.tscn")
		VariablesGlobales.vida = 5
		VariablesGlobales.RutaNivelActual = VariablesGlobales.Rutas[0]
		VariablesGlobales.Puntos = 0

func _on_colisionInferior_body_entered(body):
	position.x = 536
	position.y = 304
	
func _on_area2D_body_entered(body):
	
	if body is Meteoro1:
		meteoro1.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Meteoro2:
		meteoro2.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Meteoro3:
		meteoro3.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Meteoro4:
		meteoro4.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Meteoro5:
		meteoro5.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Meteoro6:
		meteoro6.CambiarPosicion()
		VariablesGlobales.vida -=1
		sonidogolpe.play()
	if body is Meteoro7:
		meteoro7.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is ObjetoPuntos:
		moneda.CambiarPosicion()
		SumarPuntos()
		RepSonidoMoneda()



