/// @description 

// Handle invulnerability
if (time_invul > 0) {
	--time_invul;
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_actor_alpha)) {
		id_actor = other.actor;
		alpha = global.invul_alpha;
	}
	exit;
}

// create list of all hitboxes striking the hurtbox
var _hits = ds_list_create();
with (o_event_hurt) {
	if (id_hurtbox == other.actor.hurtbox) ds_list_add(_hits, id_hitbox);
}

// iterate over list of hits, and remove any that the state has already dealt with
for (var i = 0; i < ds_list_size(hitboxes_struck); i++) {
	for (var k = 0; k < ds_list_size(_hits); k++) {
		if (hitboxes_struck[|i] == _hits[|k]) {
			ds_list_delete(_hits, k--);
		}
	}
}

// don't continue if there's nothing new hitting
if (ds_list_size(_hits) == 0) exit;

//------------------------------------------------------------------------------------------------------
// Now we have a list of new hitboxes that have struck the actor (technically the hurtbox of this state)
//------------------------------------------------------------------------------------------------------

// add to struck list
for (var i = 0; i < ds_list_size(_hits); i++) {
	ds_list_add(hitboxes_struck, _hits[|i]);
}

// state values
actor.state = id; 
time_hurt = time_hurt_max;
time_invul = time_invul_max;

// sprite
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

// hitstun
var _freeze_time_act = 0;
var _freeze_time_global = 0;
for (var i = 0; i < ds_list_size(_hits); i++) {
	var _hit = _hits[|i];
	if (_hit.freeze_targetonly) {
		if (_hit.freeze_frames > _freeze_time_act) _freeze_time_act = _hit.freeze_frames;
	} else {
		if (_hit.freeze_frames > _freeze_time_global) _freeze_time_global = _hit.freeze_frames;
	}
}
_freeze_time_act -= _freeze_time_global;
if (_freeze_time_act > 0) time_freeze = _freeze_time_act;
if (_freeze_time_global > 0) {
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_game_freeze)) freeze_time = _freeze_time_global;
}

// knockback
var _kx = _hit.x;
var _ky = _hit.y;		
if (_hit.actor != undefined) {
	_kx = _hit.actor.x;
	_ky = _hit.actor.y;
}
// determine knockback vectors, if statement is only if the knockback point of the hitbox and actor.hurtbox are identical
if (actor.hurtbox.x == _kx && actor.hurtbox.y == _ky) {
	var _velx = irandom_range(-1, 1) * _hit.knockback;
	if (_velx != 0) velx += _velx;
	else vely += pos_or_neg(_hit.knockback);
} else {
	var _vectorx = actor.hurtbox.x - _kx;
	var _vectory = actor.hurtbox.y - _ky;
	var _magnitude = sqrt(sqr(_vectorx) + sqr(_vectory));
	var _scale = _hit.knockback/_magnitude;
	var _velx = _vectorx * _scale;
	var _vely = _vectory * _scale;
	velx += _velx; // add instead of set so multiple attacks hitting at once register
	vely += _vely;
}

// effects && health
for (var i = 0; i < ds_list_size(_hits); i++) {
	var _hit = _hits[|i];
	hurt_health -= _hit.damage;
	if (hurt_health <= 0)  {
		with (instance_create_depth(x, y, LAYER_MASTER, o_event_hitbox_kill)) {
			id_hitbox = _hit;
			hit_x = other.actor.hurtbox.x;
			hit_y = other.actor.hurtbox.y;
		}
	} else {
		with (instance_create_depth(x, y, LAYER_MASTER, o_event_hitbox_hit)) {
			id_hitbox = _hit;
			hit_x = other.actor.hurtbox.x;
			hit_y = other.actor.hurtbox.y;
		}
	}
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_actor_shader)) {
		id_actor = other.actor;
		shader = other.hurt_shader;
	}
}

// death
if (hurt_health <= 0) {
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_actor_killed)) {
		id_actor = other.actor;
	}
}
