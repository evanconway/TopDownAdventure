/// @description 

// Inherit the parent event
event_inherited();

if (input_pressed(INPUT.UI_SELECT)) {
	focus_push(instance_create_depth(0, 0, LAYER_MASTER, o_scene_newgame));
	scr_play_sfx(global.sfx_ui_confirm);
}