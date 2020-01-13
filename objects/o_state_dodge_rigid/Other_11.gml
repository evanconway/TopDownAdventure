/// @description Change

if (dodge_cooldown > 0) exit;


if (ds_grid_get(actor.ai.controller.buttons, INPUT.BACK, 1)) {
	change = true;
	stage = DODGE.ACTIVE;
	dodge_time = 0;
	
	//set velocities based on current input
	var _velx = 0;
	var _vely = 0;
	with (actor.ai.controller) {
		if (down(INPUT.UP)) _vely -= other.dodge_speed;
		if (down(INPUT.DOWN)) _vely += other.dodge_speed;
		if (down(INPUT.LEFT)) _velx -= other.dodge_speed;
		if (down(INPUT.RIGHT)) _velx += other.dodge_speed;
	}
	// limit angle movement to dodge_speed
	if (_velx != 0 && _vely != 0) {
		var _max = dodge_speed*cos(pi/4);
		_velx = clamp(_velx, -1*_max, _max);
		_vely = clamp(_vely, -1*_max, _max);
	}
	dodge_vel_x = _velx;
	dodge_vel_y = _vely;
	
	scr_state_spritechange();
}
