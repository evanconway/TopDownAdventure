/// @description Logic

var _hits = ds_list_create();
var _num = instance_place_list(x, y, blocks, _hits, false);

for (var i = 0; i < _num; i++) {
	var _new_event_guard = instance_create_depth(x, y, LAYER_MASTER, o_event_guard);
	_new_event_guard.id_hitbox = _hits[|i];
	_new_event_guard.id_guardbox = id;
}

ds_list_destroy(_hits);
