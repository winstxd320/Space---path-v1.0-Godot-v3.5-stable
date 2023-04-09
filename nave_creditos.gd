extends KinematicBody2D

var direccion = Vector2.ZERO
var velocidad = 400
onready var animacion = $Sprite
onready var Textocreditos = get_parent().find_node("Creditos")
onready var Textocreditos2 = get_parent().find_node("Creditos2")
onready var animacion2 = get_parent().find_node("1")
onready var	boton = get_parent().find_node("boton")
func _physics_process(delta):
	
	direccion.y = velocidad
	animacion2.play("1")
	if position.y > 500:
		direccion.x = velocidad
		direccion.y = 0
		animacion.play("horizontal")
			
	if position.x > 950:
		direccion.y = -velocidad
		direccion.x = 0
		animacion.play("abajo")
		
	if position.y < 20:
		direccion.x = -velocidad
		direccion.y = 0
		animacion.play("horizontal")
		animacion.flip_h = true
		
	if position.x < 27:
		direccion.y = velocidad
		direccion.x = 0
		animacion.play("abajo")
		animacion.flip_v = false
		
	if position.y > 600:
		Textocreditos.show()
		Textocreditos2.show()
		animacion2.show()
		boton.show()
	move_and_slide(direccion)
