/// @description 

/*
Like many adventure games, ours will be filled with objects that you can interact with
to learn more about them. The most common objects will only need one piece of info, so
this object will make it easy to makes hundreds of them. Create an object, make this
the parent, and set the message. 
*/

// Inherit the parent event
event_inherited();

dialogue = instance_create_depth(x, y, LAYER_DIALOGUES, o_dialogue);
message = "DEFAULT INTERACT MESAGE.";
message_set = false;
interactions = 0; // number of times interacted with
