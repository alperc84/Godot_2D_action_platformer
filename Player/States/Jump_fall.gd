extends PlayerState

func unhandled_input(event:InputEvent)->void:
	parent.unhandled_input(event)

func physics_process(delta:float)->void:
	parent.physics_process(delta)

func process(delta:float)->void:
	parent.process(delta)
	state_check()

func state_check()->void:
	if	!parent.state_check():
		return
	
	var y:float = player.velocity.y
	if abs(y) < parent.jump_top_threshold:
		_state_machine.transition_to('Jump_top', {})
	elif y < parent.jump_top_threshold:
		_state_machine.transition_to('Jump', {})

func enter(msg:Dictionary = {})->void:
	player.speed = player.run_speed
	animation.play("Jump_fall")

func exit()->void:
	pass
