/// @description Change

// delete hitboxes from struck list if they no longer exist in the game world
for (var i = 0; i < ds_list_size(hitboxes_struck); i++) {
	if (!instance_exists(hitboxes_struck[|i])) ds_list_delete(hitboxes_struck, i--);
}

/*
To determine if the actor has been hit, the hurt state will iterate over
all the hurtboxes assigned to the actors current sprite and check if
any of those hurtboxes collide with a hitbox targetting this actor.
*/

/*
The first step is to make a list of all hitboxes targetting this actor.
No point iterating over everything if nothing's attack this actor right?
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

if (ds_list_size(_hitboxes) <= 0) exit; // don't continue if there's nothing targeting actor

/*
Here we can assume _hitboxes is a list of hitboxes targeting this actor. Now we compare the actors
collision mask with the each hitbox. We're going to create a list of hitboxes that are colliding
with the actor called _hits. When checking each hitbox we check to make sure we haven't already
added it to hits
*/

var _hits = ds_list_create();

for (var i = 0; i < ds_list_size(_hitboxes); i++) {
	var _hitbox = ds_list_find_value(_hitboxes, i);
	with (actor) {
		if (place_meeting(x, y, _hitbox) && 
			ds_list_find_index(other.hitboxes_struck, _hitbox) < 0) {
			ds_list_add(_hits, _hitbox);
		}
	}
}


/*
Now we have a list of NEW attacks that have struck the actor. 
*/
if (ds_list_size(_hits) > 0) {
	change = true;
	time_hurt = time_hurt_max;
	for (var i = 0; i < ds_list_size(_hits); i++) {
		var _hit = _hits[|i];
		ds_list_add(hitboxes_struck, _hit);
		
		if (_hit.hitbox_fx != undefined) instance_create_layer(actor.x, actor.y, LAYER_EFFECTS, _hit.hitbox_fx);
		global.actors_freeze_time += _hit.freeze_frames;
		/*
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
			var _velx = _vectorx * _scale; // add instead of set so multiple attacks hitting at once register
			var _vely = _vectory * _scale;
			velx += _velx; // add instead of set so multiple attacks hitting at once register
			vely += _vely;
		}
	}
}

ds_list_destroy(_hitboxes);
