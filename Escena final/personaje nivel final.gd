extends KinematicBody2D

var direccion = Vector2.ZERO
var velocidad = 50
onready var animacion = $AnimatedSprite
onready var texto = get_parent().find_node("Dialogo")
onready var muro = get_parent().find_node("muro")
onready var boton = get_parent().find_node("boton")
var a = true
func _physics_process(delta):
	
	direccion.x = velocidad
	
	var colision = move_and_collide(direccion * delta)

	if colision:
		a = false
		velocidad = 0
		direccion.x = velocidad
		texto.show()
		boton.show()
	if a == true:
		animacion.play("caminar")
	else:
		animacion.play("quieto")
