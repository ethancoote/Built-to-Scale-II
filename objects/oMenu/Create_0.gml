instance_create_depth(240, 150, depth+1, oButtonStartRoom, {
	image_xscale: image_xscale*2,
	image_yscale: image_yscale*2 ,
	image_alpha: 1
});

instance_create_depth(240, 200, depth+1, oButtonBack, {
	image_xscale: image_xscale*2,
	image_yscale: image_yscale*2 ,
	image_alpha: 0.5
});

oControl.level = 0;
oControl.weight = 80;
oControl.timer = 300;


