/// @description 

if (timed) {
	if (time++ >= time_max) instance_destroy(id);
} else if (image_index >= image_number - 1) instance_destroy(id);
/*
We make our fx sprites so they have one blank frame at the end. 
That way we can destroy them here just by checking what frame 
they're on.
*/
