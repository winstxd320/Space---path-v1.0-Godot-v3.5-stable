extends KinematicBody2D

var direccion = Vector2.ZERO
onready var TextoPuntos = get_parent().get_node("Contador Puntos")
onready var objeto1 = get_parent().get_node("Objeto1")
onready var objeto2 = get_parent().get_node("Objeto2")
onready var objeto3 = get_parent().get_node("Objeto3")
onready var objeto4 = get_parent().get_node("Objeto4")
onready var objeto5 = get_parent().get_node("Objeto5")
onready var diamante = get_parent().get_node("Diamante")
onready var sonidogolpe = get_parent().get_node("golpe")
onready var MasUno = $"+1"
onready var Tiempo = $Timer
onready var Sonido = $AudioStreamPlayer
var ContVida = 0
var Puntos = 0

func _process(delta):
	TextoPuntos.text = str(Puntos)
	
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		direccion.x = VariablesGlobales.velocidad
	elif Input.is_action_pressed("ui_left"):
		direccion.x = - VariablesGlobales.velocidad
	else:
		direccion.x = 0
	var movimiento = direccion * delta
	var colision = move_and_collide(movimiento)
	
	if VariablesGlobales.vida == 0:
		
		get_tree().change_scene("res://partida perdida.tscn")
		VariablesGlobales.vida = 5
		VariablesGlobales.RutaNivelActual = VariablesGlobales.Rutas[1]
		VariablesGlobales.Puntos = 0
		

func _on_Area2D_body_entered(body):
	if body is Objeto1:
		VariablesGlobales.vida -= 1
		objeto1.CambiarPosicion()
		sonidogolpe.play()
	if body is Objeto2:
		objeto2.CambiarPosicion()
		VariablesGlobales.vida -= 1 
		sonidogolpe.play()
	if body is Objeto3:
		objeto3.CambiarPosicion()
		VariablesGlobales.vida -= 1 
		sonidogolpe.play()
	if body is Objeto4:
		objeto4.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Objeto5:
		objeto5.CambiarPosicion()
		VariablesGlobales.vida -= 1
		sonidogolpe.play()
	if body is Diamante:
		diamante.tiempo += 100
		Puntos += 10
		ContVida += 1
		if ContVida > 4:
			ContVida = 0
			VariablesGlobales.vida += 1
			Sonido.play()
			MasUno.show()
		Tiempo.start()
		diamante.PosicionDiamante()

func _on_Timer_timeout():
	Sonido.stop()
	Tiempo.stop()
	MasUno.hide()



	
