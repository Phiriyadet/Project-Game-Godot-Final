extends Hitbox



func _on_Hitbox_area_entered(area):
	area.queue_free()
