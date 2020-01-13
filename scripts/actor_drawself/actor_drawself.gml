// this script includes shaders and other things needed when drawing the actor

if (shader != undefined) shader_set(shader);
if (invul_time > 0 && focus_cur() == global.gameworld) image_alpha = global.invul_alpha;
else image_alpha = act_alpha;
draw_self();
shader_reset();
