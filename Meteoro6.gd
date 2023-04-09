extends KinematicBody2D
class_name Meteoro6
var direccion = Vector2.ZERO
var posAleatoria_x = [348, 500, 450, 100, 200]

func CambiarPosicion():
	randomize()
	position.x = posAleatoria_x[randi() % posAleatoria_x.size()]
	position.y = 0

func _physics_process(delta):
	direccion.x = 50
	direccion.y = 200
	
	var velocidad = direccion * delta
	var colision = move_and_collide(velocidad)
	
	if colision:
		CambiarPosicion()
	if position.y > 600:
		CambiarPosicion()
