/// @description 

if (input_pressed(INPUT.UI_SELECT)) {
	with (instance_create_depth(0, 0, LAYER_MASTER, o_scene_goto_mainmenu)) {
		focus_push(id);
	}
}
