/// @description 

// find hitboxes colliding with guardbox
var _guards = ds_list_create();
with (o_event_guard) {
	if (id_guardbox == other.shield_fx_id) ds_list_add(_guards, id_hitbox);
}

// find hitboxes that have hit the actors hurtbox AND hit the guardbox
var _hurts = ds_list_create();
with (o_event_hurt) {
	for (var i = 0; i < ds_list_size(_guards); i++) {
		if (id_hitbox == _guards[|i].id_hitbox && id_hurtbox = other.actor.hurtbox) {
			ds_list_add(_hurts, id_hitbox)
		}
	}
}
