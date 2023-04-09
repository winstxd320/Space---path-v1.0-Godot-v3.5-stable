extends KinematicBody2D
class_name Objeto4

var direccion = Vector2.ZERO
var direccionAleatoria_x = [99, 120, 259, 650, 580]

func  CambiarPosicion():
	randomize()
	position.y = 632
	position.x = direccionAleatoria_x[randi() % direccionAleatoria_x.size()]
		
func _physics_process(delta):
	
	direccion.y = -300
	direccion.x =  20
	
	var colision = move_and_collide(direccion * delta)
	if colision:
		CambiarPosicion()	
	if position.y < 0:
		CambiarPosicion()
