/// @description Toggle Active

if (active) {
	var _i = ds_list_find_index(global.actor_freezers, id)
	if (_i >= 0) ds_list_delete(global.actor_freezers, _i);
	active = false;
} else {
	ds_list_add(global.actor_freezers, id);
	active = true;
}
