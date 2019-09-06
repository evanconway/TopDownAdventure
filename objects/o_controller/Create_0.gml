/// @description read me

/*
Every actor in this game has a controller. The state objects determine how
to behave based off the state of the game world, and the state of the
actors controller. Every actor has an ai object that sets the variables
of the controller object. See an actors ai object to see what's being set
when.
*/

// grid to store buttons, 2 slots are down(0) and pressed(1)
buttons = ds_grid_create(INPUT.SIZE, 2);
