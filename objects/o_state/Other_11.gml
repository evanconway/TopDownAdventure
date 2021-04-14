/// @description Change

/*
This event will set "change" to true if the actor is able to enter this state. Additionally,
it will make all changes necessary to switch the actor over to this state. 

Previously we had "change" and "connect" as two separate events/function, where connect 
determined if a state was enterable, and change actually made the changes. But since the only
time the "change" function gets called is when connect is returns true, there's not reason 
not to combine them, especially since some states need to do some of the same work in both. 
*/
