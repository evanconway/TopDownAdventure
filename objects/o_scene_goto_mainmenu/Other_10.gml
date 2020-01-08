/// @description 

switch (state) {
	case TOMAINMENU.FADEOUT:
	if (++cur_time >= time_max) {
		cur_time = 0;
		cur_alpha += alpha_change;
		if (cur_alpha >= alpha_max) {
			state++;
			cur_alpha = alpha_max;
			alpha_change *= -1; // flip fade direction
			instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_closeall);
			with (instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_active)) menu = global.mainmenu;
			room_goto(room_mainmenu);
		}
	}
	break;
	case TOMAINMENU.FADEIN:
	if (++cur_time >= time_max) {
		cur_time = 0;
		cur_alpha += alpha_change;
		if (cur_alpha <= 0) {
			with (instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_open)) menu = global.mainmenu;
			instance_destroy(id);
		}
	}
	break;
}
