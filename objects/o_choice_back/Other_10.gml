/// @description 

if (input_pressed(INPUT.UI_SELECT)) {
	instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_close);
	scr_play_sfx(global.sfx_ui_back);
}
