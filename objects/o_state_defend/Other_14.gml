/// @description Detect Guards

/* 
3rd of April, 2020
I wonder if we even need guard boxes? We could just use different hurboxes.
And honestly, for the style of blocking we're thinking of, we don't even need 
a second box, we could just intercept hurt events with the actors hurtbox, 
and perform guard events if certain conditions are true. 
*/

// find hitboxes colliding with guardbox
var _guards = ds_list_create();
with (o_event_guard) {
	if (id_guardbox == other.shield_fx_id) ds_list_add(_guards, id_hitbox);
}

// find hitboxes that have hit the actors hurtbox
var _hurts = ds_list_create();
with (o_event_hurt) {
	if (id_hurtbox == other.actor.hurtbox) ds_list_add(_hurts, id_hitbox);
}

// create list of hitboxes that are hitting the hurtbox AND the guardbox
var _defends = ds_list_create();
for (var i = 0; i < ds_list_size(_guards); i++) {
	for (var k = 0; k < ds_list_size(_hurts); k++) {
		if (_guards[|i] == _hurts[|k]) ds_list_add(_defends, _guards[|i]);
	}
}
