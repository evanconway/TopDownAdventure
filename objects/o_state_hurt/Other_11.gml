/// @description Change

// delete attacks from attack list if the attack no longer exists in the game world
for (var i = 0; i < ds_list_size(attacks_struck); i++) {
	if (!instance_exists(attacks_struck[|i])) ds_list_delete(attacks_struck, i--);
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
	
	// we'll now make some checks to ensure this hitbox/attack are setup correctly
	var _check = true;
	
	// if the hitbox does not have a defined attack, something wasn't setup right
	if (_hit.attack == undefined) {
		show_debug_message("Actor ID: " + string(actor) + " found Hitbox ID: " + string(_hit) + " with undefined attack!");
		_check = false;
	} 
	
	if (_check && !instance_exists(_hit.attack)) {
		show_debug_message("Actor ID: " + string(actor) + " found Hitbox ID: " + string(_hit) + " with attack that doesn't exist!");
		_check = false;
	}
	
	// if the attack doesn't have a defined target, something wasn't setup right
	if (_check && _hit.attack.target_ins == undefined && _hit.attack.target_obj == undefined) {
		show_debug_message("Actor ID: " + string(actor) + " found attack ID: " + string(_hit.attack) + " with no target!");
		_check = false;
	}
	
	if (_check) {
		// if target_ins of the hitbox.attack is defined, check that, otherwise use target_obj
		if (_hit.attack.target_ins != undefined && actor == _hit.attack.target_ins) {
			ds_list_add(_hitboxes, _hit);
		} else if (actor.object_index == _hit.attack.target_obj) {
			ds_list_add(_hitboxes, _hit);
		}
	}
}

if (ds_list_size(_hitboxes) <= 0) exit; // don't continue if there's nothing targeting actor

/*
Here we should explain an uncertainty in our plan. Should we implement the ability for different
hitboxes in one attack to do different things? For example, should the tip of a sword deal more
damage than the rest of it? If we allow for things like this, then hitbox processing gets even 
more complicated. At the moment I'm inclined to NOT try more complicated. If we assume all hitboxes
in an attack are treated the same, then we only need to find one hitbox that connects, and then
we can assume the "attack" has connected. I like the idea of eventually making something really
complicated that can handle stuff like certain hitboxes, or combinations of hitboxes, producing
different effects. For this project, it's probably better to keep it simple. So... in this next
step, all we need to find is one hitbox that collides with one hurtbox, and we consider the 
attack connecting. 
*/
var _attacks = ds_list_create();
var _hurtboxes = ds_map_find_value(hurtboxes, actor.sprite_index);
if (_hurtboxes != undefined) {
	for (var i = 0; i < ds_list_size(_hitboxes); i++) for (var k = 0; k < ds_list_size(_hurtboxes); k++) {
		var _hitbox = ds_list_find_value(_hitboxes, i);
		with (ds_list_find_value(_hurtboxes, k)) {
			/*
			If the current hitbox at i collides with a hurtbox, and the attack for that hitbox
			is not already in the list, AND the attack for that hitbox is not already in the 
			states attacks_struck list, then this attack is a proper hit. We add the ID of the 
			attack to the list and end the hurtbox loop so we can look at the next hitbox.
			*/
			if (place_meeting(x, y, _hitbox) && 
				ds_list_find_index(_attacks, _hitbox.attack) < 0 &&
				ds_list_find_index(other.attacks_struck, _hitbox.attack) < 0) {
				ds_list_add(_attacks, _hitbox.attack);
				k = ds_list_size(_hurtboxes);
			}
		}
	}
} else {
	// if no hurtbox map is defined, we do same as above, but with actors default collision mask
	// this loop is copy pasted... should we put it in a script??
	for (var i = 0; i < ds_list_size(_hitboxes); i++) {
		var _hitbox = ds_list_find_value(_hitboxes, i);
		with (actor) {
			if (place_meeting(x, y, _hitbox) && 
				ds_list_find_index(_attacks, _hitbox.attack) < 0 &&
				ds_list_find_index(other.attacks_struck, _hitbox.attack) < 0) {
				ds_list_add(_attacks, _hitbox.attack);
			}
		}
	}
}

/*
Now we have a list of NEW attacks that have struck the actor. 
*/
if (ds_list_size(_attacks) > 0) {
	change = true;
	time_hurt = time_hurt_max;
	for (var i = 0; i < ds_list_size(_attacks); i++) {
		var _atk = _attacks[|i];
		ds_list_add(attacks_struck, _atk);
		/*
		As a design decision, attacks will apply knockback direction based on the position of the 
		attack relative to the actor. If my math is right, all we need to do is determine the
		vector of the attack relative to the actor, determine it's magnitude, and scale that down
		to the attacks knockback value. In the unlikely scenario the attack and the actor have
		the same x/y, we randomize the velocity.
		*/
		if (actor.x == _atk.x && actor.y == _atk.y) {
			var _velx = irandom_range(-1, 1) * _atk.knockback;
			if (_velx != 0) velx += _velx;
			else vely += pos_or_neg(_atk.knockback);
		} else {
			var _vectorx = actor.x - _atk.x;
			var _vectory = actor.y - _atk.y;
			var _magnitude = sqrt(sqr(_vectorx) + sqr(_vectory));
			var _scale = _atk.knockback/_magnitude;
			var _velx = _vectorx * _scale; // add instead of set so multiple attacks hitting at once register
			var _vely = _vectory * _scale;
			//if (_velx == 0) _velx = pos_or_neg(0.1);
			//if (_vely == 0) _vely = pos_or_neg(0.1);
			velx += _velx; // add instead of set so multiple attacks hitting at once register
			vely += _vely;
		}
	}
}

ds_list_destroy(_hitboxes);
ds_list_destroy(_attacks);
if (_hurtboxes != undefined) ds_list_destroy(_hurtboxes);
