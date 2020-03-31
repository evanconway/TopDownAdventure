/// @description 

remain = true;
if (!ds_grid_get(actor.ai.controller.buttons, block_button, 0) 
	&& block_stuntime <= 0) {
		remain = false;
		velx = 0;
		vely = 0;
		ds_list_clear(hitboxes_blocked);
		if (block_barrier_fx_id != undefined) instance_destroy(block_barrier_fx_id);
}
