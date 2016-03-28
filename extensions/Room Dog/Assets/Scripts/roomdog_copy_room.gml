///roomdog_copy_room()

/*
    Saves the current room to a file. This
    stores all non-persistent objects and
    all tiles. No creation code is saved,
    but object attributes like scale and 
    angle are.
*/

var FNAME = "roomChunks\"+room_get_name(room) + ".txt";
ds_list_add(RoomChunkManager.fileChunks,FNAME);

var f = file_text_open_write(FNAME);

ds_map_add(roomWidths, FNAME, room_width);
ds_map_add(roomHeights, FNAME, room_height);

with(all)
    if(not persistent)
    {
        var STRING = string(object_index) + " " + 
                     string(x) + " " + 
                     string(y) + " " + 
                     string(image_xscale) + " " + 
                     string(image_yscale) + " " + 
                     string(image_angle);
        file_text_write_string(f,STRING);
        file_text_writeln(f);
    }
    
var tiles = tile_get_ids();
for (var i = 0; i < array_length_1d(tiles); i++;)
{
    var STRING = "";
    STRING = "-1 " +
            string(tile_get_background(tiles[i])) + " " +
            string(tile_get_left(tiles[i])) + " " +
            string(tile_get_top(tiles[i])) + " " +
            string(tile_get_width(tiles[i])) + " " +      
            string(tile_get_height(tiles[i])) + " " +
            string(tile_get_x(tiles[i])) + " " +
            string(tile_get_y(tiles[i])) + " "+
            string(tile_get_depth(tiles[i]));
    file_text_write_string(f, STRING);
    file_text_writeln(f);
}
    
file_text_close(f);