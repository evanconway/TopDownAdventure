/// @description 

// Inherit the parent event
event_inherited();

name = "Hurt";

time_hurt_max = 10; // frames in hurt state
time_hurt = time_hurt_max;
velx = 0;
vely = 0;

/*
Hurtboxes is a map. The keys are Sprite IDs, and the values are lists of 
hurtboxes. When the hurt state checks for hitboxes, it will use the 
appropriate list of hurtboxes for the actors current sprite. If the
actors sprite is not in the map, then the actors collision mask is used
instead.
*/
hurtboxes = ds_map_create();
hurt_health = 3;
death_fx = undefined;
death_snd = undefined;

hurt_shader = undefined;