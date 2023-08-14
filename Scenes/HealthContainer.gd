extends Control
@onready var HealthIconScene = preload("res://Scenes/HeartScene.tscn")
@export var HealthCount : int = 8
var CurrentHealth : int = 0

@onready var HealthNode : HBoxContainer = get_node("HBox")

func _ready() -> void:
	for i in range(HealthCount):
		AddHeart()
	print(CurrentHealth)
	
func RemoveHeart() -> void:
	HealthNode.get_child(-1).queue_free()
	CurrentHealth -= 1

func AddHeart() -> void:
	HealthNode.add_child(HealthIconScene.instantiate())
	CurrentHealth += 1
