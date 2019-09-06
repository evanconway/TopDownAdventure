/// @description 

// Inherit the parent event
event_inherited();
 
if (count > 0) count--;
else {
	with (controller) resetcontroller();
	count = irandom_range(count_min, count_max);
	if (aidirection == 4) aidirection = irandom_range(0, 3); // 4 directions
	else aidirection = 4;
}

switch (aidirection) {
	case DIR.UP:
	with (controller) press(INPUT.UP);
	break;
	case DIR.DOWN:
	with (controller) press(INPUT.DOWN);
	break;
	case DIR.LEFT:
	with (controller) press(INPUT.LEFT);
	break;
	case DIR.RIGHT:
	with (controller) press(INPUT.RIGHT);
	break;
	case 4:
	// do nothing lololol
	break;
}
