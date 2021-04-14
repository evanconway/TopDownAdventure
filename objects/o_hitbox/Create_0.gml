/// @description

/*
29th of March, 2020

We're going to redo how hitboxes work. Using our new events system, we should
be able to trim down the amount of code in the parent hitbox, and move it to
invidivual hitboxes. We're doing away with hitboxes having targets. Now, 
hurtboxes detect hitboxes they're vulnerable to, and hitboxes simply update
their own positions and animations.

There are going to be so many different kinds of hitboxes:

Ones that follow the body of enemies, so they damage the play when they touch.
Any sort of spell is going to be a hitbox. 
Swords or melee attacks.
Thorns on bushes, spikes on walls.

Using events, all these different hiboxes will be coded individually. So now
we won't need all these variables like "visible", or "permenant" for something
that has no need for that data. 
*/

damage = 1;
knockback = 1.6;
invisible = false;
freeze_frames = global.hitfreezeframes;
freeze_targetonly = false;
actor = undefined;
