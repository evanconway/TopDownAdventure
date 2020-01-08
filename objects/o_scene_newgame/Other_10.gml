/// @description 

switch (state) {
	case NEWGAME.FADEOUT:
	if (++cur_time >= time_max) {
		cur_time = 0;
		cur_alpha += alpha_change;
		if (cur_alpha >= alpha_max) {
			state++;
			cur_alpha = alpha_max;
			alpha_change *= -1; // flip fade direction
			instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_closeall);
			room_goto(global.gameworld.firstroom);
		}
	}
	break;
	case NEWGAME.FADEIN:
	if (++cur_time >= time_max) {
		cur_time = 0;
		cur_alpha += alpha_change;
		if (cur_alpha <= 0) {
			focus_set(global.gameworld);
			instance_destroy(id);
		}
	}
	break;
}
