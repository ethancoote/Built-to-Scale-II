if level_weight[level] <= weight {
	win = true;
}

if win {
	win = false;
	instance_create_depth(oPlayer.x, oPlayer.y, 1, oHole, {
		image_index: 0
	});
	oPlayer.win = true;
}