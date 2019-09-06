/// @description GameMaker Camera Explained

showdims = false;

/*
It is critical to understand that this camera object is NOT the Game Maker 
camera. Changing the position of this object does not change the position
of the Game Maker camera! Watch this video for a brief overview:
https://www.youtube.com/watch?v=_g1LQ6aIJFk
Here are the most important functions to remember:

window_set_size() - sets the size of the application window
surface_resize() - sets resolution of game
set_view_size() - sets area of room shown on camera
set_view_pos() - sets position of camera in room

We need to explain how these functions/values all interact with one another.

Firstly, the window_set_size() function determines the dimensions of the
application window. When the application is set to fullscreen, anything
that window_set_size() trys to overwrite is ignored. I'm 100% sure, but
I'm pretty sure full size just locks the dimensions of your window to
the native resolution of the computer monitor.

Now surface_resize() is the thing that totally threw us off last time. It
scales, not stretches, scales to the window size. This means that if the
window has dimensions of 16:9, and the surface has dimensions of 4:3, then
you will get a 4:3 game with black bars on the side inside of the 16:9 
window. And if you have a 16:9 surface with a 4:3 window, you'll get 
a 16:9 game with black bars on the top and bottom of a 4:3 window.

Finally, the view is STRETCHED to the surface. This is an important 
difference. If the view has 4:3 dimensions, and the surface has 16:9,
then the 4:3 view will get stretched and distorted into a 16:9 picture.

If we want pixel perfection, then the view must have the EXACT same ratio
as the surface to avoid stretching, and the dimensions of the window
must be an integer multiplication of the surface.
*/

/*
With all of that said, we're going to try something kind of weird for this 
game. Instead of picking a resolution, we're going to set multipliers for
a starting screen ratio. Given our understanding of screens (outlined
above), the view and resolution will be identical, and the window
will be an integer multiplication of those dimensions.
*/

// multipliers
m_min = 20;
m_max = 120;
var _start_m = 20;
window_multiplier = 4;
m_window_w = _start_m * window_multiplier;
m_window_h = _start_m * window_multiplier;
m_resolution_w = _start_m;
m_resolution_h = _start_m;
m_view_w = _start_m;
m_view_h = _start_m;

#macro SCREEN_RATIO_WIDTH 16
#macro SCREEN_RATIO_HEIGHT 9

#macro WINDOW_W o_camera.m_window_w * SCREEN_RATIO_WIDTH
#macro WINDOW_H o_camera.m_window_h * SCREEN_RATIO_HEIGHT
#macro RESOLUTION_W o_camera.m_resolution_w * SCREEN_RATIO_WIDTH
#macro RESOLUTION_H o_camera.m_resolution_h * SCREEN_RATIO_HEIGHT
#macro VIEW_W o_camera.m_view_w * SCREEN_RATIO_WIDTH
#macro VIEW_H o_camera.m_view_h * SCREEN_RATIO_HEIGHT

window_set_size(WINDOW_W, WINDOW_H);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

enum CAMFOLLOW {
	RIGID,
	BOUNDS
}

follow_type = CAMFOLLOW.BOUNDS;
var _bound_m = 10;
follow_bound_x = RESOLUTION_W/_bound_m; // distance from view position
follow_bound_y = RESOLUTION_H/_bound_m;
