extends Control

@onready var video_player : VideoStreamPlayer = $CenterContainer/AspectRatioContainer/VideoStreamPlayer
@onready var h_slider: HSlider = $HSlider

var is_eligible : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h_slider.max_value = video_player.get_stream_length()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(video_player.stream_position)
	h_slider.value = video_player.stream_position


func _on_h_slider_value_changed(value: float) -> void:
	if is_eligible:
		video_player.stream_position = value


func _on_h_slider_drag_started() -> void:
	is_eligible = true
	

func _on_h_slider_drag_ended(value_changed: bool) -> void:
	is_eligible = false


func _on_button_button_down() -> void:
	var effect = AudioEffectReverb
	AudioServer.add_bus_effect(1, effect, 2)
