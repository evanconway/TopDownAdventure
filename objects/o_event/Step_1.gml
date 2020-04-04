/// @description Delete Self

/*
We have events self-delete at the beginning of the frame, so that they can be
used until the very end of the frame they are created. 
*/

instance_destroy(id);
