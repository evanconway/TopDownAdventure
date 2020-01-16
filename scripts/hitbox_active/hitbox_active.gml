/// @param hitbox

// returns true if hitbox active, false if not

result = false;

// trick for calling outside of hitboxes
if (argument_count > 0) {
	with (argument[0]) {
		result = hitbox_active();
	}
	return result;
}

var result = false;

/* we use less than or equal because frames displayed is always incremented
before the frame is drawn */
if (hitbox_frames_displayed() <= active) result = true;

return result;
