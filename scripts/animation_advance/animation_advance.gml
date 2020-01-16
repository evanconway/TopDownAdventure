/// @param animation

// trick for calling outside of hitboxes
if (argument_count > 0) {
	with (argument[0]) animation_advance();
	exit;
}

animation_index_frame++;
if (animation_index_frame >= ds_list_find_value(animation_data, animation_index_sprite)) {
	animation_index_frame = 0;
	animation_index_sprite++;
	if (animation_index_sprite >= image_number - 1) {
		show_error("Animation sprite index set too far!", true);
	}
}
