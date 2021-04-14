/// @param freeze_frames
function scr_freezetime(argument0) {

	// Game will freeze a minimum of 1 frame
	with (instance_create_depth(0, 0, LAYER_MASTER, o_event_game_freeze)) {
		freeze_time = argument0;
	}



}
