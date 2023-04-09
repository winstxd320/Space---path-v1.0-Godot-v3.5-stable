extends StaticBody2D

func QuitarPared() -> void:
	if VariablesGlobales.Puntos == 5:
		position.x = 0
		position.y = 0
		
