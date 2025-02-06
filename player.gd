extends RigidBody3D

## Vertical force to apply when moving
@export_range(0,3000) var thrust: float = 1000.0

## Horizontal force to apply when moving
@export_range(0,300) var torque_thrust: float = 100.0

var is_transitioning: bool = false

@onready var lose_audio: AudioStreamPlayer = $LoseAudio
@onready var success_audio: AudioStreamPlayer = $SuccessAudio
@onready var rocket_audio: AudioStreamPlayer3D = $RocketAudio
@onready var booster_particles: GPUParticles3D = $BoosterParticles
@onready var left_booster_particles: GPUParticles3D = $LeftBoosterParticles
@onready var right_booster_particles: GPUParticles3D = $RightBoosterParticles
@onready var explosion_particles: GPUParticles3D = $ExplosionParticles
@onready var success_particles: GPUParticles3D = $SuccessParticles

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_force(basis.y * delta * thrust)
		booster_particles.emitting = true
		if rocket_audio.playing == false:
			rocket_audio.play()
		
	else:
		booster_particles.emitting = false
		rocket_audio.stop()	

	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0, 0, torque_thrust) * delta)
		right_booster_particles.emitting = true
	else:
		right_booster_particles.emitting = false
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0, 0, -torque_thrust) * delta)
		left_booster_particles.emitting = true
	else:
		left_booster_particles.emitting = false
		
func _on_body_entered(body: Node) -> void:
	if not(is_transitioning):
		if 'Goal' in body.get_groups():
			complete_level(body.file_path)
		
		if 'Hazad' in body.get_groups():
			crash_sequence()

func crash_sequence() ->void:
	print('KABOOM!')
	lose_audio.play()
	explosion_particles.emitting = true
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1)
	tween.tween_callback(get_tree().reload_current_scene)
	
	
func complete_level(next_level_file: String) ->void:
	print('level completed')
	success_particles.emitting = true
	success_audio.play()
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
	
