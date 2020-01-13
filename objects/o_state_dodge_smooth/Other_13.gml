/// @description 

// Inherit the parent event
event_inherited();

// only reference instance variables if instance still exists
if (instance_exists(id) && dodge_cooldown > 0) dodge_cooldown--;
