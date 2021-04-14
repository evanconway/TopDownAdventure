/// @description 

// Inherit the parent event
event_inherited();

name = "Hurt";
time_hurt_max = 30; // frames in hurt state
time_hurt = time_hurt_max;
time_invul_max = 60;
time_invul = 0;
time_freeze = 0; // used for hitboxes that only freeze the actor hit
velx = 0;
vely = 0;
hitboxes_struck = ds_list_create();
hurt_health = 3;
hurt_shader = sh_red;
