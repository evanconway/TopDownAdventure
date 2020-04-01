/// @description Change


if (down(block_button, actor.ai.controller)) {
	change = true;
	time_stun = 0;
	scr_play_sfx(activate_snd);
	scr_state_spritechange();
	shield_fx_id = scr_fx_create(actor.x, actor.y, shield_fx, LAYER_PLAYER - 1);
	var _dir = actor.actdirection;
	var _act_w = actor.bbox_right - actor.bbox_left;
	var _act_h = actor.bbox_bottom - actor.bbox_top;
	var _box_w = shield_fx_id.bbox_right - shield_fx_id.bbox_left;
	var _box_h = shield_fx_id.bbox_bottom - shield_fx_id.bbox_top;
	with (shield_fx_id) {
		switch (_dir) {
			case DIR.UP:
				image_angle = 180;
				y -= _act_h/2;
				y -= _box_h/2;
				break;
			case DIR.DOWN:
				y += _act_h/2;
				y += _box_h/2;
				break;
			case DIR.LEFT:
				x -= _act_w/2;
				x -= _box_w/2;
				image_angle = 90;
				break;
			case DIR.RIGHT:
				x += _act_w/2;
				x += _box_w/2;
				image_angle = -90;
				break;
		}
	}
}
