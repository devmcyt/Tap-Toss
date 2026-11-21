draw_self();

if (mouse_check) {
    var _launch_dir = point_direction(x, y, x_check, y_check);
    var _dist = point_distance(x_check, y_check, mouse_x, mouse_y);
    
    _dist = min(_dist, max_mouse_check);
    
    var _start_vx = lengthdir_x(_dist * spd_check, _launch_dir);
    var _start_vy = lengthdir_y(_dist * spd_check, _launch_dir);
    
    for (var t = 0; t < 60; t += 4) { 
        var _pred_x = x + (_start_vx * t);
        var _pred_y = y + (_start_vy * t) + (0.5 * gravity_check * (t * t));
        
        draw_set_color(c_white);
        draw_circle(_pred_x, _pred_y, 3, false);
    }
}