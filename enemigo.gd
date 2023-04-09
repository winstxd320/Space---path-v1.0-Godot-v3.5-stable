extends KinematicBody2D

class_name Enemigo

var direccion = Vector2.ZERO
var detectarColision = true
var velocidad = 100
onready var animacion = $animacion
func _physics_process(delta):

	direccion.x = velocidad
	
	# Inteligencia artificial del enemigo
	if is_on_wall():
		detectarColision = not detectarColision
		
	if detectarColision == true:
		direccion.x = velocidad
		animacion.flip_h = false
	else: 
		direccion.x = - velocidad
		animacion.flip_h = true
		
	move_and_slide(direccion, Vector2.UP)
