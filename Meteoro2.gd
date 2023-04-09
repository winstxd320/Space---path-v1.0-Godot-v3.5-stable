extends KinematicBody2D
class_name Meteoro2

var posAleatoria_x = [932, 800, 1100]
var posAleatoria_y = [500, 380, 310]

var direccion = Vector2.ZERO

func CambiarPosicion():
	position.x = posAleatoria_x[randi() % posAleatoria_x.size()]
	position.y = posAleatoria_y[randi() % posAleatoria_y.size()]
		
func _physics_process(delta):
	
	direccion.x = -200
	direccion.y = -200
	
	var colision = move_and_collide(direccion * delta)
	
	if colision:
		CambiarPosicion()
func _on_colisionSuperior_body_entered(body):
	CambiarPosicion() 
