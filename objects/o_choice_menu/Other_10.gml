/// @description Choice Logic

if (input_pressed(INPUT.UI_SELECT)) {
	if (submenu != undefined) {
		with (instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_open)) menu = other.submenu;
		scr_play_sfx(global.sfx_ui_select);
	}
}
