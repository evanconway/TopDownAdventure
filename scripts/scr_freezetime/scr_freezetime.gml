/// @param freeze_frames

// Game will freeze a minimum of 1 frame
with (instance_create_depth(0, 0, LAYER_MASTER, o_actorfreezer)) {
	freeze_time = argument0;
	focus_push(id);
}
