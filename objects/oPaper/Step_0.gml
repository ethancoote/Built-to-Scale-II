if place_meeting (x, y, walls) && hit == false{
	speed = 0;
	image_index = 0;
	sprite_index = sPaperBallBreak;
	hit = true;
}

if place_meeting (x, y, oPlayer) && hit == false{
	speed = 0;
	image_index = 0;
	sprite_index = sPaperBallBreak;
	hit = true;
	oPlayer.hit = true;
}

if depth_timer > 0 {
	depth_timer--;
} else {
	depth = -100;
}

if hit {
	depth = -100;
	if image_index == 5 {
		instance_destroy();
	}
}