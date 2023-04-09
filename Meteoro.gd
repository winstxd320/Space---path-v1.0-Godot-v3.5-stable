extends KinematicBody2D
class_name Meteoro1

var direccion = Vector2.ZERO
var posAleatoria_x = [100 , 400, 10]

func CambiarPosicion():
	
	position.x = posAleatoria_x[randi() % posAleatoria_x.size()]
	position.y = 0 


func _physics_process(delta):
	
	direccion.x = 200
	direccion.y = 200
		
	var collide = move_and_collide(direccion *  delta)
	
	if collide:
		CambiarPosicion()
func _on_Node2D_body_entered(body):
	CambiarPosicion()
	
