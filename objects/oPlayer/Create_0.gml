// stats
spd = 2.5;

// timers and movement
hor_move = 0;
ver_move = 0;
x_spd = 0;
y_spd = 0;

// getting tilemaps
walls = [layer_tilemap_get_id("Walls"), 
		 layer_tilemap_get_id("Environment")];