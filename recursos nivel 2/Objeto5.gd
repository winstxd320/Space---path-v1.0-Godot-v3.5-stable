extends KinematicBody2D
class_name Objeto5

var direccion = Vector2.ZERO
var direccionAleatoria_x = [859, 750, 880, 650, 590]

func  CambiarPosicion():
	randomize()
	position.y = 633
	position.x = direccionAleatoria_x[randi() % direccionAleatoria_x.size()]
		
func _physics_process(delta):
	
	direccion.y = -300
	direccion.x = -50
	
	var colision = move_and_collide(direccion * delta)
	if colision:
		CambiarPosicion()	
	if position.y < 0:
		CambiarPosicion()
