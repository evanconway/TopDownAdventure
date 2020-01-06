// returns true if the dialogue box is no longer active and has finished closing

var result = true;

if (active) result = false;
if (width_cur > 0) result = false;
if (height_cur > 0) result = false;

return result;
