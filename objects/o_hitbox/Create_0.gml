/// @description 

enum HITBOX {
	POSITION,
	PROJECTILE
}

type = HITBOX.POSITION;

/*
Hitboxes that need to match their position to an actor will need to know what attack
made them. Attacks will match position of actors, so hitboxes can match their position
to attack to match to the actor.
*/
attack = undefined

/*
You may have noticed that the sprite is literally a single red pixel. That's because
we're going to experiment with stretching the x and y scales of each hitbox to suit
whatever needs we want. 
*/

image_xscale = 10;
image_yscale = 10;

permenant = false
time_delay = 0; // frames before hitbox is active (0 is active same frame as creation)
time_active = 0; 

/*
Positions is supposed to be a ds_grid where the width is the total number of frames
the hitbox lasts, the height is 2 for the x/y positions of the hitbox.
*/
time_position = 0; // frame counter for positions
positions = ds_grid_create(0, 2); // be sure to delete and make a new one

// projectile variables.
hitbox_x = x;
hitbox_y = y;
hitbox_center_x = 0; // set to the center of the hitbox by update event
hitbox_center_y = 0;
xvel = 0;
yvel = 0;
