randomize();

// Only create/initialize the score variable if it doesn't exist yet!
// This way, it starts at 0 when the game opens, but NEVER resets when you reload levels.
if (!variable_global_exists("collision_counter")) {
    global.collision_counter = 0;
}

// 1. Gather all the manually placed pads from the room
var _all_pads = [];
with (obj_tramp_parent) {
    array_push(_all_pads, id);
}

// 2. Shuffle them randomly
_all_pads = array_shuffle(_all_pads);

// 3. Keep a random number of pads (between 4 and 8) and destroy the rest
var _total_placed = array_length(_all_pads);
var _pads_to_keep = min(_total_placed, irandom_range(4, 8));

for (var i = _pads_to_keep; i < _total_placed; i++) {
    instance_destroy(_all_pads[i]);
}