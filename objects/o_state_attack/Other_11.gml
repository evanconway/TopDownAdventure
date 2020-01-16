/// @description Change

if (attack_oneonly && attack_one_id != undefined && instance_exists(attack_one_id)) exit;

if (attack_cooldown > 0) exit;

if (ds_grid_get(actor.ai.controller.buttons, attack_button, 1)) {
	change = true;
	stage = ATTACK.STARTUP;
	time = startup;
	attack_cooldown = attack_cooldown_max;
	scr_state_spritechange();
}
