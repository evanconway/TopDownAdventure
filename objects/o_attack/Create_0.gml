/// @description Read Me

/*
We've been writing up our ideas in a text document, but let's get the gist of them out here.
The o_attack object isn't going to really do very much. All it actually does is give us a 
place to put all the creation code for hitboxes and their data (timing and position) and 
a unifying instance ID that ties all the hitboxes together. This way when an actor is hit
by a hitbox, the actor actually stores the ID of the o_attack, not the hitbox. And if that
actor gets hit by another hitbox in the same o_attack, the actor knows to ignore it. 
*/

// attacks will target an instance or object, not both
target_ins = undefined; // instance ID this attack affects
target_obj = undefined; // object this attack affects


sprite = undefined;

damage = 1;
knockback = 0.1;

/*
Attack objects need a way to know when to delete themselves. By design, we will always put
the last hitbox to delete itself in this variable. The o_attack will check it every frame 
to see if it is gone, and if it is, the o_attack will delete itself. 
*/
last_hitbox = undefined;
