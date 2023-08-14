class_name PatrolAction extends ActionBT

@export var Speed : int
var TargetPosition : Vector2
var screenRes : Vector2
var Actor : CharacterBody2D

func _ready() -> void:
	screenRes = get_viewport_rect().size
	NewTarget()
	
func Evaluate(Data : DataTreeClass) -> NodeState:
	Actor = Data.Get("Actor")
			# Move towards the target position
	Actor.velocity = (TargetPosition - Actor.position).normalized() * Speed
	Actor.move_and_slide()

	# Check if the Actor has reached the target position
	if Actor.position.distance_to(TargetPosition) < 5.0:
		Actor.position = TargetPosition
		NewTarget()

			# Return success when the patrol is completed
		return NodeState.SUCCESS
			

	# Return RUNNING while the patrol is in progress
	return NodeState.RUNNING

func NewTarget():
	
	TargetPosition = Vector2(randi_range(0,screenRes.x), randi_range(0,screenRes.y))

func ResetBehaviour() -> void:
	print("Restarted")
	NewTarget()
