function findplayer() {
	// set player variable if possible

	if (global.player == undefined) {
		global.player = instance_find(o_player, 0);
	} else if (!instance_exists(global.player)) {
		global.player = instance_find(o_player, 0);
	}



}
