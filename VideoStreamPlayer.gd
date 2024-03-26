extends VideoStreamPlayer

@onready var timeSlider: Slider = get_node("/root/Control/TimeSlider")
@onready var VideoLength
@onready var VideoTime 

# Called when the node enters the scene tree for the first time.
func _ready():
	set_paused(true)
	$/root/Control/VideoLength.text = str(get_stream_length()).pad_decimals(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused == false:
		VideoTime = str(stream_position).pad_decimals(0)
		print(VideoTime)
		$/root/Control/VideoTime.text = VideoTime
	
func _on_check_loop_button_pressed():
	set_loop(!loop)

func _on_pause_button_pressed():
	set_paused(!paused)
	$/root/Control/StartButton.text = "PAUSE"

func _on_volume_hslider_value_changed(value):
	set_volume(value)
#probably use stream positions to decide where to stop the video
#we technically could check every single second until we reach the breakpoint one
