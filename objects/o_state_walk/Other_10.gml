/// @description Logic

// Inherit the parent event
event_inherited();

// first we calculate movement
var _speed = walkspeed;
var _vely = 0;
var _velx = 0;

with (actor) {
	
	/*
	Since movement and collisions calculations have to be made in 
	this, we're going to set the actors game maker x/y to its 
	true x/y. This will allow us to use the game maker collision
	scripts like place meeting to check against walls. So for this
	step, the "true" x/y will actually be game makers x/y, and 
	the act_x/y won't be used. But at the very end, the act_x/y
	will get set to the true values, and the game maker x/y will
	get rounded back to integers.
	*/
	x = act_x;
	y = act_y;

	// Initial velocity determined by inputs
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
	
	/*
	Now we will determine the direction of the actor. We should explain the behavior
	we want. When the actor inputs only a single, cardinal input, the directon is 
	that of the input. If the actor is going a direction and another, non-opposite
	input is added, the actors direction will stay the same. Said another way, we 
	want the actor to be able to continue in a cardinal direction but make adjustments.
	So the actor could be heading East towards a door, but they're slightly too low, so
	the user taps the up key, and the actor moves up a little without changing the 
	direciton it's facing. 
	*/
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
