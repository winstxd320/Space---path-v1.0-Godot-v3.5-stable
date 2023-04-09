extends KinematicBody2D
class_name Meteoro4

var direccion = Vector2.ZERO
var posAleatoria_y = [664, 600]
var posAleatoria_x = [557,  300, 650 ]

func CambiarPosicion():
	position.y = posAleatoria_y[randi() % posAleatoria_y.size()]
	position.x = posAleatoria_x[randi() % posAleatoria_x.size()]
		
func _physics_process(delta):
	
	direccion.x =  -50
	direccion.y = -200
	
	var movimiento = direccion * delta
	var  colision = move_and_collide(movimiento)
	if colision:
		CambiarPosicion()
func _on_colisionSuperior_body_entered(body):
	CambiarPosicion()	
 
