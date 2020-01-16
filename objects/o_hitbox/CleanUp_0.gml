/// @description 


for (var i = 0; i < ds_list_size(hitbox_fx_created); i++) {
	var _fx = hitbox_fx_created[|i];
	if (_fx != undefined && instance_exists(_fx)) instance_destroy(_fx);
}

ds_list_destroy(hitbox_fx_created);
ds_list_destroy(hitbox_frames);
