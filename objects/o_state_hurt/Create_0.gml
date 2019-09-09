/// @description 

// Inherit the parent event
event_inherited();

name = "Hurt";

attacks_struck = ds_list_create();

/*
Hurtboxes is a map. The keys are Sprite IDs, and the values are lists of 
hurtboxes. When the hurt state checks for hitboxes, it will use the 
appropriate list of hurtboxes for the actors current sprite. If the
actors sprite is not in the map, then the actors collision mask is used
instead.
*/
hurtboxes = ds_map_create();

time_hurt_max = 120; // frames in hurt state
time_hurt = time_hurt_max;
velx = 0;
vely = 0;
