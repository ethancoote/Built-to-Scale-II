#macro TS 16

var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

global.mp_grid = mp_grid_create(0,0, _w, _h, TS, TS);

var _lay_id = layer_get_id("Walls");
var _map_id = layer_tilemap_get_id(_lay_id);

var _lay_id1 = layer_get_id("Environment");
var _map_id1 = layer_tilemap_get_id(_lay_id1);

for (var _i = 0; _i < _w; _i++) {
	for (var _j = 0; _j < _h; _j++) {
		if (tilemap_get_at_pixel(_map_id, _i * TS, _j * TS) > 0) || 
		   (tilemap_get_at_pixel(_map_id1, _i * TS, _j * TS) > 0) {
			mp_grid_add_cell(global.mp_grid, _i, _j);
		}
	}
}

//mp_grid_add_instances(global.mp_grid, ,false);