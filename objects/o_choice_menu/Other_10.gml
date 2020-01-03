/// @description Choice Logic

if (input_pressed(INPUT.SELECT) || input_pressed(INPUT.INTERACT)) {
	if (submenu != undefined) {
		focus_push(submenu);
		submenu.active = true;
	}
}
