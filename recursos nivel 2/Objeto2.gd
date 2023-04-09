extends KinematicBody2D
class_name Objeto2
var direccion = Vector2.ZERO
var direccionAleatoria_x = [713, 800, 950]

func CambiarPosicion():
	randomize()
	position.y = 634
	position.x = direccionAleatoria_x[randi() % direccionAleatoria_x.size()]

func _physics_process(delta):
	
	direccion.y = -200
	direccion.x =  -35
	
	var colision = move_and_collide(direccion * delta)
	if colision:
		CambiarPosicion()
	if position.y < 0:
		CambiarPosicion()
