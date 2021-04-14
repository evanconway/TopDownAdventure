/// @param doortile_enum
function doortile_setxy(argument0) {

	// Sets the correct exit xy values for the doortile given the enum
	// called in creation code in room editor
	door_dir = argument0;
	switch(argument0) {
		case DIR.UP:
		exit_x = x + sprite_width/2;
		exit_y = y - 8;
		break;
		case DIR.DOWN:
		exit_x = x + sprite_width/2;
		exit_y = y + sprite_height*1.5;
		break;
		case DIR.LEFT:
		exit_x = x - sprite_width/2;
		exit_y = y + sprite_height/2;
		break;
		case DIR.RIGHT:
		exit_x = x + sprite_width*1.5;
		exit_y = y + sprite_height/2;
		break;
	}


}
