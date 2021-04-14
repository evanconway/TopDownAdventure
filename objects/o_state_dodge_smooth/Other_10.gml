/// @description Logic

switch (stage) {
	case DODGE.ACTIVE:
	with (instance_create_depth(0, 0, 0, o_event_actor_alpha)) {
		id_actor = other.actor;
		alpha = 0;
	}
	
	// this movement code is take from the walk state
	var _speed = dodge_speed;
	var _vely = 0;
	var _velx = 0;
	with (actor) {
		x = act_x;
		y = act_y;
		with (ai.controller) {
			if (down(INPUT.UP)) _vely -= _speed;
			if (down(INPUT.DOWN)) _vely += _speed;
			if (down(INPUT.LEFT)) _velx -= _speed;
			if (down(INPUT.RIGHT)) _velx += _speed;
		}
		if (_velx != 0 && _vely != 0) {
			var _max = _speed*cos(pi/4);
			_velx = clamp(_velx, -1*_max, _max);
			_vely = clamp(_vely, -1*_max, _max);
		}
		var _dir = actdirection;
		// if no x velocity, actor must be heading only up or down
		if (_velx == 0) {
			x = round_int(x);
			if (_vely < 0) _dir = DIR.UP;
			if (_vely > 0) _dir = DIR.DOWN;
		}
		// if no y velocity, actor is only heading left or right
		if (_vely == 0) {
			y = round_int(y);
			if (_velx < 0) _dir = DIR.LEFT;
			if (_velx > 0) _dir = DIR.RIGHT;
		}
		/*
		If the non-zero y velocity is the same as last frame, and the x velocity
		has changed, then the actor should remaing moving up or down.
		*/
		if (_vely != 0 && _vely == other.vely_prev && _velx != other.velx_prev) {
			if (_vely < 0) _dir = DIR.UP;
			else _dir = DIR.DOWN;
		}
		// same principle for x velocity
		if (_velx != 0 && _velx == other.velx_prev && _vely != other.vely_prev) {
			if (_velx < 0) _dir = DIR.LEFT;
			else _dir = DIR.RIGHT;
		}
		// set actor direction and sprite, but only if it has changed
		if (_dir != actdirection) {
			actdirection = _dir;
			with (other) scr_state_spritechange();
			image_index = 0;
		}
		// check against walls
		_velx = approach_solid_x(_velx);
		x += _velx;	
		_vely = approach_solid_y(_vely);
		y += _vely;
		// the x/y value switch mentioned above
		act_x = x;
		act_y = y;
		x = round_int(x);
		y = round_int(y);
	}
	velx_prev = _velx;
	vely_prev = _vely;
	
	// create dodge effect
	if (++effect_time >= effect_time_max) {
		effect_time = 0;
		if (dodge_fx_move != undefined) instance_create_depth(actor.x, actor.y, LAYER_PLAYER + 1, dodge_fx_move);
	}
	// log button presses
	for (var i = 0; i < ds_list_size(dodge_buffer_buttons); i++) {
		var _button = ds_list_find_value(dodge_buffer_buttons, i);
		if (pressed(_button, actor.ai.controller)) {
			ds_list_set(dodge_buffer_pressed, i, true);
		}
	}
	// if dodge time finished, reset variables
	if (++dodge_time >= dodge_time_max) {
		stage++;
		dodge_cooldown = dodge_cooldown_max;
		//shader = undefined;
		if (dodge_fx_appear != undefined) instance_create_depth(actor.x, actor.y, LAYER_PLAYER - 1, dodge_fx_appear);
	}
	
	break;
	case DODGE.DONE:
	
	break;
}
