/// @description Choice Logic

if (input_pressed(INPUT.UI_SELECT)) {
	if (submenu != undefined) {
		focus_push(submenu);
		submenu.active = true;
	}
}
