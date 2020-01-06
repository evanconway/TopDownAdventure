/// @description READ ME

/*
We want hitstun in the game, and before we were doing that by using a global
"actor freeze time" variable. However, since we've started using this focus 
system, we could instead create objects that take focus, and pop themselves 
from focus after the correct number of frames. This seems more elegent to me
because it requires one less global variable that must be checked by actors
during their update. Ideally, nothing would ever check global vars.
Use the script to create these objects. The game will always freeze a 
minimum of 1 frame, so there's no point in trying to create a 0 frame freeze.
*/

freeze_time = 1;