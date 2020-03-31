/// @description Logic

var _hits = ds_list_create();
var _num = instance_place_list(x, y, vulnerable, _hits, false);

for (var i = 0; i < _num; i++) {
	var _new_event_hurt = instance_create_depth(x, y, LAYER_MASTER, o_event_hurt);
	_new_event_hurt.id_hitbox = _hits[|i];
	_new_event_hurt.id_hurtbox = id;
}

ds_list_destroy(_hits);
