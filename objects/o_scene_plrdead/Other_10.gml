/// @description 
switch (state) {
	case PLRDEAD.SHOCK:
	if (--counter <= 0) {
		state++;
		global.player.sprite_index = s_plr_hurt_front;
		counter = 45;
	}
	break;
	case PLRDEAD.DYING:
	if (--counter <= 0) state++;
	break;
	case PLRDEAD.FADEOUT:
	if (++fade_time >= fade_time_max) {
		fade_time = 0;
		fade_alpha += fade_change;
		if (fade_alpha > 1.5) { // compare higher than 1 to extend black time
			state++;
			fade_alpha = 1;
			room_restart();
			room_goto(global.spawn_room);
		}
	}
	break;
	case PLRDEAD.FADEIN:
		if (++fade_time >= fade_time_max) {
		fade_time = 0;
		fade_alpha -= fade_change;
		if (fade_alpha < 0) {
			focus_pop();
			instance_destroy(id);
		}
	}
	break;
}