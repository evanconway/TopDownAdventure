/// @description 

/*
To determine if the actor has been hit, we will iterate over
all the hurtboxes assigned to the actors current sprite and check if
any of those hurtboxes collide with a hitbox targetting this actor.
*/

/*
The first step is to make a list of all hitboxes targetting this actor.
No point iterating over everything if nothing's attacking this actor right?
*/
var _hitboxes = ds_list_create();
for (var i = 0; i < instance_number(o_hitbox); i++) {
	var _hit = instance_find(o_hitbox, i)
	
	if (_hit.target_ins != undefined && actor == _hit.target_ins) ds_list_add(_hitboxes, _hit);
	
	if (_hit.target_obj != undefined && 
		(actor.object_index == _hit.target_obj || object_is_ancestor(actor.object_index, _hit.target_obj))) {
		// one extra check to make sure the hitbox wasn't already added for having target_ins defined as well
		if (ds_list_find_index(_hitboxes, _hit) < 0) ds_list_add(_hitboxes, _hit);
	}
}

/*
Next, we delete any hitboxes from this list that aren't "active". Active is a variable
in the hitbox object. We determine if a hitbox is active by checking if its frame 
count is less than its active counter.
*/
for (var i = 0; i < ds_list_size(_hitboxes); i++) {
	if (!hitbox_active(_hitboxes[|i])) ds_list_delete(_hitboxes, i--);
}

/*
Here we can assume _hitboxes is a list of active hitboxes targeting this actor. Now we compare the 
actors collision mask with the each hitbox. We're going to create a list of hitboxes that are colliding
with the actor called _hits. When checking each hitbox we check to make sure we haven't already
added it to hits
*/
var _hits = ds_list_create();

for (var i = 0; i < ds_list_size(_hitboxes); i++) {
	var _hitbox = ds_list_find_value(_hitboxes, i);
	with (actor) {
		if (place_meeting(x, y, _hitbox) && ds_list_find_index(act_hitboxes_struck, _hitbox) < 0) {
			ds_list_add(_hits, _hitbox);
		}
	}
}

/*
Finally we remove any hitboxes from the list that the actor has not properly blocked. We've decided
that blocking will be very generous. If the actor is facing in the correct x direction OR Y 
direction, the attack will be blocked. Since all hitboxes are designed around a center origin, we
can literally just compare the x/y location of the hitbox against that of the actor. Note also that
unlike our last project, there are no "defend" boxes. The collision mask of the actor is the defend
box. 

If the actor x/y is the same as the hitbox x/y, we will count the move is blocked. And remember, 
we are removing the hits that were NOT blocked, the comparisons will be the opposite.

for (var i = 0; i < ds_list_size(_hits); i++) {
	var _hit = _hits[|i];
	switch (actor.actdirection) {
		case DIR.UP:
			if (_hit.y > actor.y) {
				ds_list_delete(_hits, i--);	
			}
		break;
		case DIR.DOWN:
			if (_hit.y < actor.y) {
				ds_list_delete(_hits, i--);	
			}
		break;
		case DIR.LEFT:
			if (_hit.x > actor.x) {
				ds_list_delete(_hits, i--);	
			}
		break;
		case DIR.RIGHT:
			if (_hit.x < actor.x) {
				ds_list_delete(_hits, i--);	
			}
		break;
	}
}
*/
/*
Now we have a list of NEW attacks that have struck the actor. Process
blockstun and calculate velocities.
*/

for (var i = 0; i < ds_list_size(_hits); i++) {
	var _hit = _hits[|i];
	scr_play_sfx(block_snd);
	scr_fx_create(actor.x, actor.y, block_fx);
	with (actor) ds_list_add(act_hitboxes_struck, _hit);
	if (_hit.delete_on_hit) _hit.marked_for_deletion = true;
		
	// we check to ensure the game hasn't already been frozen this same frame before freezing
	if (focus_cur() == global.gameworld) {
		with (_hit) {
			if (freeze_targetonly) other.actor.act_freezetime = freeze_frames;
			else scr_freezetime(freeze_frames);
		}
	}
	
	//set blockstun
	block_stuntime += _hit.freeze_frames;
	
	/*
	set velocities
	If the hitbox has its actor defined, then the knockback is relative to the
	actor attacking. If not, the knockback is relative to the hitbox itself.
	*/
	var _kx = _hit.x;
	var _ky = _hit.y;
		
	if (_hit.actor != undefined) {
		_kx = _hit.actor.x;
		_ky = _hit.actor.y;
	}
	if (actor.x == _kx && actor.y == _ky) {
		var _velx = irandom_range(-1, 1) * _hit.knockback;
		if (_velx != 0) velx += _velx;
		else vely += pos_or_neg(_hit.knockback);
	} else {
		var _vectorx = actor.x - _kx;
		var _vectory = actor.y - _ky;
		var _magnitude = sqrt(sqr(_vectorx) + sqr(_vectory));
		var _scale = _hit.knockback/_magnitude;
		var _velx = _vectorx * _scale;
		var _vely = _vectory * _scale;
		velx += _velx; // add instead of set so multiple attacks hitting at once register
		vely += _vely;
	}
}

// process velocity movement, but only if in block stun
if (block_stuntime > 0) {
	block_stuntime--;
	with (actor) {
		x = act_x;
		y = act_y;
		x += approach_solid_x(other.velx);
		y += approach_solid_y(other.vely);
		act_x = x;
		act_y = y;
		x = round_int(act_x);
		y = round_int(act_y);
	}
	with (actor) actor_setsprite(other.block_stun_sprite);
} else {
	ds_list_clear(actor.act_hitboxes_struck);
	velx = 0;
	vely = 0;
	with (actor) actor_setsprite(other.block_sprite);
}
