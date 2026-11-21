var dx = other.x - other.xprevious;
var dy = other.y - other.yprevious;

var prev_left = other.bbox_left - dx;
var prev_right = other.bbox_right - dx;
var prev_top = other.bbox_top - dy;
var prev_bottom = other.bbox_bottom - dy;

var hit = false;

if (prev_bottom <= bbox_top) {
    other.y += bbox_top - other.bbox_bottom;
    other.stored_vspeed = abs(other.vspeed);
    other.vspeed = -max(other.stored_vspeed * other.bounce_boost * other.momentum_loss, 8);
    hit = true;
}
else if (prev_top >= bbox_bottom) {
    other.y += bbox_bottom - other.bbox_top;
    other.stored_vspeed = abs(other.vspeed);
    other.vspeed = max(other.stored_vspeed * other.bounce_boost * other.momentum_loss, 8);
    hit = true;
}
else if (prev_right <= bbox_left) {
    other.x += bbox_left - other.bbox_right;
    other.stored_hspeed = abs(other.hspeed);
    other.hspeed = -max(other.stored_hspeed * other.bounce_boost * other.momentum_loss, 8);
    hit = true;
}
else if (prev_left >= bbox_right) {
    other.x += other.bbox_right - other.bbox_left;
    other.stored_hspeed = abs(other.hspeed);
    other.hspeed = max(other.stored_hspeed * other.bounce_boost * other.momentum_loss, 8);
    hit = true;
}

if (hit) {
    if (other.sound_cooldown <= 0) {
        audio_play_sound(The_Jump, 1, false);
        other.sound_cooldown = 10;
    }
    sprite_index = Tramp_Check;
    alarm[0] = 8;
	global.collision_counter += 1;
}