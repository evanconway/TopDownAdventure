/// @description 

// beware, permenant fx must be deleted by outside code.
if (permenant) exit;

if (timed) {
	if (time-- <= 0) instance_destroy(id);
} else if (image_index >= image_number - 1) instance_destroy(id);

/*
We make our fx sprites so they have one blank frame at the end. 
That way we can destroy them here just by checking what frame 
they're on.
*/
