extends VideoStreamPlayer

@onready var TimeSlider: Slider = get_node("/root/Control/TimeSlider")
@onready var VideoLength
@onready var VideoTime
@onready var value

# Called when the node enters the scene tree for the first time.
func _ready():
	set_paused(true)
	$/root/Control/VideoLength.text = str(get_stream_length()).pad_decimals(0)
	TimeSlider.max_value = get_stream_length()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused == false:
		VideoTime = str(stream_position).pad_decimals(0)
		$/root/Control/VideoTime.text = VideoTime
		value = stream_position
		TimeSlider.value = stream_position
		if is_playing() == false:
			$/root/Control/StartButton.text = "RESTART"

func _on_check_loop_button_pressed():
	set_loop(!loop)

func _on_pause_button_pressed():
	set_paused(!paused)
	$/root/Control/StartButton.text = "PAUSE"
	if is_playing() == false:
		play()

func _on_volume_hslider_value_changed(value):
	set_volume(value)
#probably use stream positions to decide where to stop the video
#we technically could check every single second until we reach the breakpoint one

func _on_time_slider_drag_ended(value_changed):
	value_changed = value
