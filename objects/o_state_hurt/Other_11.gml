/// @description Change

/*
To determine if the actor has been hit, the hurt state will iterate over
all the hurtboxes assigned to the actors current sprite and check if
any of those hurtboxes collide with a hitbox targetting this actor.
*/

// skip this step if actor has invulnerable time
if (actor.invul_time > 0) exit;

// skip this if actor state is invulnerable
if (actor.state.invulnerable) exit;

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

if (ds_list_size(_hitboxes) <= 0) exit; // don't continue if there's nothing targeting actor

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
Now we have a list of NEW attacks that have struck the actor. 
*/
if (ds_list_size(_hits) > 0) {
	if (audio_is_playing(_hit.miss_snd)) audio_stop_sound(_hit.miss_snd);
	change = true;
	time_hurt = time_hurt_max;
	actor.invul_time = actor.invul_time_max;
	if (hurt_shader != undefined) actor.shader = hurt_shader; // check user_event 0
	with (actor) {
		switch (actdirection) {
			case DIR.UP:
			actor_setsprite(other.sprite_back);
			break;
			case DIR.DOWN:
			actor_setsprite(other.sprite_front);
			break;
			case DIR.LEFT:
			actor_setsprite(other.sprite_left);
			break;
			case DIR.RIGHT:
			actor_setsprite(other.sprite_right);
			break;
		}
	}
	for (var i = 0; i < ds_list_size(_hits); i++) {
		var _hit = _hits[|i];
		with (actor) ds_list_add(act_hitboxes_struck, _hit);
		if (_hit.delete_on_hit) _hit.marked_for_deletion = true;
		scr_fx_create(actor.x, actor.y, _hit.hitbox_fx);
		
		// we check to ensure the game hasn't already been frozen this same frame before freezing
		if (focus_cur() == global.gameworld) {
			with (_hit) {
				if (freeze_targetonly) other.actor.act_freezetime = freeze_frames;
				else scr_freezetime(freeze_frames);
			}
		}
		
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
			var _velx = _vectorx * _scale;
			var _vely = _vectory * _scale;
			velx += _velx; // add instead of set so multiple attacks hitting at once register
			vely += _vely;
		}
		
		/*Death sounds*/
		if (--hurt_health <= 0) {
			scr_play_sfx(death_snd);
			ds_list_destroy(_hitboxes);
			ds_list_destroy(_hits);
			scr_fx_create(actor.x, actor.y, death_fx);
			actor.killed = true;
			exit;
		} else {
			scr_play_sfx(_hit.hit_snd);
		}
	}
}

ds_list_destroy(_hitboxes);
ds_list_destroy(_hits);
