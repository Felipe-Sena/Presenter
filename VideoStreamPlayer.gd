extends VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_check_loop_button_pressed():
	set_loop(!loop)

func _on_pause_button_pressed():
	set_paused(!paused)

func _on_volume_hslider_value_changed(value):
	set_volume(value)
#probably use stream positions to decide where to stop the video
#we technically could check every single second until we reach the breakpoint one
