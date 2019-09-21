/// @description 

if (!scr_actors_frozen() && global.actors_freeze_time < 0) {
	if (timed) {
		if (time >= time_max) instance_destroy(id);
		else time++;
	} else if (image_index >= image_number - 1) instance_destroy(id);
}
