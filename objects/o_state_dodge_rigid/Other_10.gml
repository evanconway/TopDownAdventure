/// @description Logic

switch (stage) {
	case DODGE.ACTIVE:
	// move actor
	with (actor) {
		var _velx = other.dodge_vel_x;
		var _vely = other.dodge_vel_y;
		x = act_x;
		y = act_y;
		/*
		Remember, when we call "approach_solid", the game uses the built-in
		x/y of the instance. We HAVE to set the x/y to their true values before
		calling these functions.
		*/
		_velx = approach_solid_x(_velx);
		x += _velx;	
		_vely = approach_solid_y(_vely);
		y += _vely;
		act_x = x;
		act_y = y;
		x = round_int(act_x);
		y = round_int(act_y);
	}
	if (++effect_time >= effect_time_max) {
		effect_time = 0;
		scr_fx_create(actor.x, actor.y, dodge_effect, LAYER_PLAYER+1);
	}
	// if dodge time finished, reset variables
	if (++dodge_time >= dodge_time_max) {
		stage++;
		dodge_cooldown = dodge_cooldown_max;
	}
	break;
	case DODGE.DONE:
	break;
}
