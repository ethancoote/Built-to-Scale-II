var _pitch = random_range(2.3, 2.7);

if place_meeting (x, y, walls) && hit == false{
	speed = 0;
	image_index = 0;
	sprite_index = sPaperBallBreak;
	audio_play_sound_at(hit3, x, y, 0, 100, 300, 1, false, 0, 1, 0, _pitch);
	hit = true;
}

if place_meeting (x, y, oPlayer) && hit == false{
	speed = 0;
	image_index = 0;
	sprite_index = sPaperBallBreak;
	audio_play_sound_at(hit1, x, y, 0, 100, 300, 1, false, 0, 0.3, 0, 1);
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