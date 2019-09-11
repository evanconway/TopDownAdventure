/// @description 

enum HITBOX {
	POSITION,
	PROJECTILE
}

type = HITBOX.POSITION;

target_ins = undefined;
target_obj = undefined;

knockback = 1;
actor = undefined;

// projectile variables
hitbox_x = x;
hitbox_y = y;
xvel = 0;
yvel = 0;

hitbox_fx = undefined;
freeze_frames = 10;
