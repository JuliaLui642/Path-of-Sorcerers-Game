class_name Pick_up extends Area2D

@export var item: Item = null: set = set_item

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_item(item)
	_animation_player.play("idle")
	body_entered.connected(func(body Node2D)-> void:
		if body is Player:
			item.use(body)
		animation_player.play("destroy")
		set_deferred("monitoring", false)
		_audio_stream_player.play()
		_animation_player.animation_finished.connect(func(_animation_name: String) -> void:
			queue_free()
		)
	


func set_item(value: Item) -> void:
	item = value
	if_sprite2d != null:
		_sprite2d.texture = item.texture
	if _audio_stream_player != null:
		_audio_stream_player.stream = item.sound_on_pickup
