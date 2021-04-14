/// @description Detect Guards

if (actor.state != id) exit;

// clear hitboxes from list that are no longer present
for (var i = 0; i < ds_list_size(hitboxes_blocked); i++) {
	if (!instance_exists(hitboxes_blocked[|i])) ds_list_delete(hitboxes_blocked, i--);
}

// list of hitboxes hurting the actor
var _hurts = ds_list_create();
with (o_event_hurt) {
	if (id_hurtbox == other.actor.hurtbox) {
		ds_list_add(_hurts, id_hitbox);
		instance_destroy(id); // intercept so that hurt state doesn't respond
	}
}

// remove hitboxes already dealt with
for (var i = 0; i < ds_list_size(hitboxes_blocked); i++) {
	for (var k = 0; k < ds_list_size(_hurts); k++) {
		if (hitboxes_blocked[|i] == _hurts[|k]) ds_list_delete(_hurts, k--);
	}
}

// iterate over all hits, determine hitstun and velocity
var _hit = false;
for (var i = 0; i < ds_list_size(_hurts); i++) {
	_hit = true;
	ds_list_add(hitboxes_blocked, _hurts[|i]);
	
	// determine velocity, direction is orientation relative to hurtbox
	// magnitude is damage of hitbox
	var _vel_x = actor.x - _hurts[|i].x;
	var _vel_y = actor.y - _hurts[|i].y;
	var _scalar = _hurts[|i].damage/point_distance(_hurts[|i].x, _hurts[|i].y, actor.x, actor.y);
	_scalar *= vel_hurt_scalar; // increase by built-in scalar	
	_vel_x *= _scalar;
	_vel_y *= _scalar;
	vel_x += _vel_x;
	vel_y += _vel_y;
	
	time_stun = time_stun_max;
	with (instance_create_depth(0, 0, 0, o_event_game_freeze)) {
		freeze_time = _hurts[|i].freeze_frames;
	}
}

if (_hit) {
	scr_play_sfx(block_snd);
	scr_fx_create(actor.x, actor.y, o_fx_smack_blue, LAYER_EFFECTS);
}
