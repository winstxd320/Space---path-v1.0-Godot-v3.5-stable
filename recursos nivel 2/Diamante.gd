extends KinematicBody2D
class_name Diamante 

var direccion = Vector2.ZERO
var tiempo = 0

func PosicionDiamante():
	randomize()
	var posicionY =  int(rand_range(600, 700))
	var posicionX = int(rand_range(64, 960))
	
	position.y = posicionY
	position.x = posicionX

func _physics_process(delta):
	print(tiempo)
	direccion.y = - VariablesGlobales.velocidad
	direccion.x = 0

	var velocidad = direccion * delta
	var colision = move_and_collide(velocidad)
	if colision:
		PosicionDiamante()
	
	if position.y < 0:
		tiempo += 1
		if tiempo > 500:
			tiempo = 0
			PosicionDiamante()
			

