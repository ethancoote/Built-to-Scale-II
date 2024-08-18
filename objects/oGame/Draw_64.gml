// lives
if oPlayer.hp == 3 {
	health_sprite = sLives3;
} else if oPlayer.hp == 2 {
	health_sprite = sLives2;
} else if oPlayer.hp == 1 {
	health_sprite = sLives1;
} else {
	health_sprite = sLives0;
}

draw_sprite_ext(health_sprite, image_index, 46, 18, image_xscale*2, image_yscale*2, 0, c_white, 1);

// lose
if lose {
	draw_set_halign(fa_center);
	draw_set_font(fnPixel);
	draw_text(240, 96, "You Got Fired...");
	draw_set_halign(fa_left);
}


