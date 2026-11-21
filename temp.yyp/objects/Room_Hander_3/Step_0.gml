if (init_alpha > 0) {
    init_alpha = max(0, init_alpha - fade_check);
} else {
    instance_destroy(); 
}
