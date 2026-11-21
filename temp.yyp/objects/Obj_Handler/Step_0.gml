if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    mouse_check = true;
    gravity = 0; 
    speed = 0;   
}

if (mouse_check) {
	
    var _dir = point_direction(x_check, y_check, mouse_x, mouse_y);
    var _dist = point_distance(x_check, y_check, mouse_x, mouse_y);
	
	_dist = min(_dist, max_mouse_check);
	
	x = x_check + lengthdir_x(_dist, _dir);
    y = y_check + lengthdir_y(_dist, _dir);
	
	if (mouse_check_button_released(mb_left)) {
			mouse_check = false;
			
			var _launch_dir = point_direction(x, y, x_check, y_check);
			
			hspeed = lengthdir_x(_dist * spd_check, _launch_dir);
			vspeed = lengthdir_y(_dist * spd_check, _launch_dir);
			
			
		gravity = gravity_check;
    }
}

if (sound_cooldown > 0) {
    sound_cooldown--;
}