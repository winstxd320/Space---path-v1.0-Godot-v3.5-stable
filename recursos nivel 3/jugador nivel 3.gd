extends KinematicBody2D

class_name JugadorNivel3
var direccion = Vector2.ZERO
var gravedad = 9.8
var en_suelo = false
export var FuerzaSalto = 350
export var masa = 0.0
export var Impulzo = 200
const velocidad = 200
onready var diamant = get_parent().find_node("doble salto")
onready var diamant2 = get_parent().find_node("doble salto 2")
onready var diamant3 = get_parent().find_node("doble salto 3")
onready var diamant4 = get_parent().find_node("doble salto 4")
onready var diamant5 = get_parent().find_node("doble salto 5")
onready var Oro = get_parent().find_node("Oro")
onready var Oro2 = get_parent().find_node("Oro2")
onready var Oro3 = get_parent().find_node("Oro3")
onready var Oro4 = get_parent().find_node("Oro4")
onready var Oro5 = get_parent().find_node("Oro5")
onready var sonido = get_parent().find_node("sonido")
onready var ParedInvisible = get_parent().find_node("Pared Invisible")
onready var musica = get_parent().find_node("sonido misterioso")
onready var sonidogolpe = get_parent().find_node("golpe")
onready var animacion = $AnimatedSprite


func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		direccion.x = velocidad
		animacion.play("caminar")
		animacion.flip_h = false
		
		if Input.is_action_pressed("ui_up") and en_suelo == true:
			direccion.y = - FuerzaSalto
			
	elif Input.is_action_pressed("ui_left"):
		direccion.x = - velocidad
		animacion.play("caminar")
		animacion.flip_h = true

		if Input.is_action_just_pressed("ui_up") and en_suelo == true:
			direccion.y = - FuerzaSalto	
				
	elif Input.is_action_pressed("ui_up") and en_suelo == true:
		
		direccion.y = - FuerzaSalto
		animacion.play("saltar")
		
	elif not is_on_floor():
		animacion.play("saltar")
		
	else:
		direccion.x = 0
		animacion.play("esperar")
		
	direccion.y += gravedad * masa
	
	if is_on_floor():
		en_suelo = true	
		
	else: 
		en_suelo = false
		
	#Segundo parametro del vector de move and slide, detecta si hay un objeto suelo
	#en la parte de arriba Vector.up o hacia abajo Vector.down
	
	move_and_slide(direccion, Vector2.UP)
	direccion.x = lerp(direccion.x, 0, 0.20)
	
	#Jugador pierde. Se llama a la escena partida perdida
	if VariablesGlobales.vida == 0:
		get_tree().change_scene("res://partida perdida.tscn")
		VariablesGlobales.vida = 5
		VariablesGlobales.Puntos = 0
	
	#Elimina pared de la escena
	elif VariablesGlobales.Puntos == 5:
		ParedInvisible.QuitarPared()
	
	#Controla todas las colisiones de los objetos
func _on_Area2D_body_entered(body):
	
	if body is DobleSalto:
		direccion.y = - FuerzaSalto - Impulzo
		diamant.eliminar_escena()
		
	if body is DobleSalto2:
		direccion.y = - FuerzaSalto - Impulzo
		diamant2.eliminar()
		
	if body is DobleSalto3:
		direccion.y = - FuerzaSalto - Impulzo
		diamant3.eliminar_escena()	
		
	if body is DobleSalto4:
		diamant4.eliminar()
		direccion.y = - FuerzaSalto - Impulzo
		
	if body is DobleSalto5:
		diamant5.eliminar_escena()
		
		direccion.y = - FuerzaSalto - Impulzo - 100
	if body is Enemigo:
		VariablesGlobales.vida -= 1
		direccion.y = - 400
		direccion.x = - 300	
		sonidogolpe.play()
	if body is D:
		VariablesGlobales.Puntos += 1
		Oro.eliminar_escena()
		sonido.play()
		
	if body is D2:
		VariablesGlobales.Puntos += 1
		Oro2.eliminar_escena()
		sonido.play()
		
	if body is D3:
		VariablesGlobales.Puntos += 1
		Oro3.eliminar_escena()
		sonido.play()
		
	if body is D4:
		VariablesGlobales.Puntos += 1
		Oro4.eliminar_escena()
		sonido.play()
		
	if body is D5:
		VariablesGlobales.Puntos += 1
		Oro5.eliminar_escena()
		sonido.play()
		musica.play()
		


