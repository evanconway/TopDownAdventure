/// @description 

remain = true;
if (!down(block_button, actor.ai.controller) && time_stun <= 0) {
		remain = false;
		vel_x = 0;
		vel_y = 0;
		ds_list_clear(hitboxes_blocked);
		if (shield_fx_id != undefined) instance_destroy(shield_fx_id);
}
