/// @description Check To Delete

if (last_hitbox == undefined) instance_destroy(id);
else if (!instance_exists(last_hitbox)) instance_destroy(id);
