/// @description Remain

if (time_hurt <= 0) {
	remain = false;
	with (actor) ds_list_clear(act_hitboxes_struck);
	velx = 0;
	vely = 0;
} else remain = true;
