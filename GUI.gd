extends CanvasLayer

onready var TextoVida = $TextoVida

func _process(delta):
	TextoVida.text = str(VariablesGlobales.vida)
