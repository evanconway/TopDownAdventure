/// @description Logic

// Inherit the parent event
event_inherited();

// first we calculate movement
var _speed = walkspeed;
var _vely = 0;
var _velx = 0;

with (actor) {
	
	/*
	Since movement calculations have to made in this, we're going
	to set the actors game maker x/y to its true x/y. So for this
	step, the "true" x/y will actually be game makers x/y, and 
	the act_x/y won't be used. But at the very end, the act_x/y
	will get set to the true values, and the game maker x/y will
	get rounded back to integers.
	*/
	x = act_x;
	y = act_y;

	with (ai.controller) {
		if (down(INPUT.UP)) _vely -= _speed;
		if (down(INPUT.DOWN)) _vely += _speed;
		if (down(INPUT.LEFT)) _velx -= _speed;
		if (down(INPUT.RIGHT)) _velx += _speed;
	}
	
	// limit angle movement to walkspeed
	if (_velx != 0 && _vely != 0) {
		var _max = _speed*cos(pi/4);
		_velx = clamp(_velx, -1*_max, _max);
		_vely = clamp(_vely, -1*_max, _max);
	}
	
	// check against walls
	_velx = approach_wall_x(_velx);
	x += _velx;
	
	_vely = approach_wall_y(_vely);
	y += _vely;

/*
Then we deterimine the sprite of the actor. We do this
by comparing the current velocity against the previous
velocity, and seeing what's changed. That we the 
direction sprite of the actor reflects the most 
recent input.
*/
	var _dir = actdirection;

	if (_velx == 0) {
		x = round_int(x);
		if (_vely < 0) _dir = DIR.UP;
		if (_vely > 0) _dir = DIR.DOWN;
	}

	if (_vely == 0) {
		y = round_int(y);
		if (_velx < 0) _dir = DIR.LEFT;
		if (_velx > 0) _dir = DIR.RIGHT;
	}

	if (_vely != 0 && _vely != other.vely_prev) {
		if (_vely < 0) _dir = DIR.UP;
		else _dir = DIR.DOWN;
	}

	if (_velx != 0 && _velx != other.velx_prev) {
		if (_velx < 0) _dir = DIR.LEFT;
		else _dir = DIR.RIGHT;
	}

	if (_dir != actdirection) {
		actdirection = _dir;
		with (other) scr_state_spritechange();
		image_index = 0;
	}
	
	// the x/y value switch mentioned above
	act_x = x;
	act_y = y;
	x = round_int(x);
	y = round_int(y);
}

velx_prev = _velx;
vely_prev = _vely;
