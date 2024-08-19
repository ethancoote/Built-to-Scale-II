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

draw_sprite_ext(health_sprite, image_index, 28, 12, image_xscale*2, image_yscale*2, 0, c_white, 1);

// lose
if lose {
	
	
	instance_create_depth(240, 170, depth+1, oButtonMenu, {
		image_xscale: image_xscale*2,
		image_yscale: image_yscale*2 ,
		image_alpha: 1
	});

	
	lose = false;
	draw_lose = true;
}

if draw_lose { 
	draw_sprite(sLose, 0, 174, 90);
	/*
	draw_set_halign(fa_center);
	draw_set_font(fnPixel);
	draw_text(240, 96, "You Got Fired...");
	draw_set_halign(fa_left);
	*/
}

if win {

	instance_create_depth(240, 170, depth+1, oButtonMenu, {
		image_xscale: image_xscale*2,
		image_yscale: image_yscale*2 ,
		image_alpha: 1
	});
	win = false;
	draw_win = true
}

if draw_win {
	/*
	draw_set_halign(fa_center);
	draw_set_font(fnPixel);
	draw_text(240, 96, "You Win!");
	draw_set_halign(fa_left);
	*/
	draw_sprite(sWin, 0, 174, 90);
}

// progress bar
var _goal = oControl.level_weight[oControl.level] - weight;
var _cur = oControl.weight - weight;
var _perc = _cur / _goal;
if _perc > 1 {
	_perc = 1;
}
draw_sprite_ext(sProgBarBack, image_index, 108, 12, image_xscale*2, image_yscale*2, 0, c_white, 1);
draw_sprite_ext(sProgBar, image_index, 108, 12, image_xscale*2*_perc, image_yscale*2, 0, c_white, 1);