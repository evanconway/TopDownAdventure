/// @description read me

#macro STATE_EVENT_LOGIC 0
#macro STATE_EVENT_CHANGE 1
#macro STATE_EVENT_REMAIN 2

/*
Like our previous project, we will use state objects to govern actor behavior. 
Our implementation of states might be a bit over-engineered, but it worked well
for us last time, so let's do it again. Here's the basic run down: an actor 
will always be running a "state". That state has a main update script, or 
event, that determines the behavior of that actor. For example, the "walk" state
would move the actor to the right as long as the player was holding right on the
controller. States also have a list of other states. Everyframe, the actor will 
check to see if the current state will stayin. If it can't, the actor will 
check every state in the connection list. The first one to return true with 
its connect function is the one the actor will switch to. If no state has
a connect that returns true, the actor stays in its current state.

For this project, we're going to experiment with using user events instead of 
scripts for the state functions. Hopefully this will keep the states more
organized. 
*/

name = "undefined";
actor = undefined;

connections = ds_list_create();

// state change vars, reset in end step
change = false; // set true by user event 1 if can connect
remain = false; // set true by user event 3 if can stayin

sprite_front = undefined;
sprite_right = undefined;
sprite_left = undefined;
sprite_back = undefined;
