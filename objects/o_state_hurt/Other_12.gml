/// @description Remain

if (time_hurt <= 0) {
	remain = false;
	ds_list_clear(attacks_struck);
	velx = 0;
	vely = 0;
} else remain = true;
