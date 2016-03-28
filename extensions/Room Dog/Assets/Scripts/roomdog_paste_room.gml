///roomdog_paste_room(room_or_filename, X, Y, FLIP_X_optional, FLIP_Y_optional)

/*
    Pastes the saved room to a position in
    the currrent room.
*/

var ROOM = argument[0];
var ROOM_TXT_FILE;

if(string_count(".txt", string(ROOM)) == 0)
    ROOM_TXT_FILE = "roomChunks\" + room_get_name(ROOM) + ".txt";
else
    ROOM_TXT_FILE = ROOM;

var X = argument[1];
var Y = argument[2];
var FLIP_X = 1;
var FLIP_Y = 1;

if(argument_count>3)
    FLIP_X = argument[3];
if(argument_count>4)
    FLIP_Y = argument[4];

if(!file_exists(ROOM_TXT_FILE))
{
    show_debug_message("file ["+string(ROOM_TXT_FILE)+"]not found!");
    return false;
}

var f = file_text_open_read(ROOM_TXT_FILE);
var ROOM_WIDTH = roomdog_get_room_width(ROOM_TXT_FILE);
var ROOM_HEIGHT = roomdog_get_room_height(ROOM_TXT_FILE);

while(not file_text_eof(f))
{   
    var vals = ds_list_create();
    
    while(not file_text_eoln(f))
    {
        ds_list_add(vals,file_text_read_real(f));
    }
    
    if(ds_list_find_value(vals,0) == -1)
    {
        var t = tile_add(ds_list_find_value(vals,1),
                         ds_list_find_value(vals,2),
                         ds_list_find_value(vals,3),
                         ds_list_find_value(vals,4),
                         ds_list_find_value(vals,5),
                     X + ds_list_find_value(vals,6) * FLIP_X + (max(0,-FLIP_X) * ROOM_WIDTH),
                     Y + ds_list_find_value(vals,7) * FLIP_Y + (max(0,-FLIP_Y) * ROOM_HEIGHT),
                         ds_list_find_value(vals,8));
        tile_set_scale(t,FLIP_X,FLIP_Y);
    }
    else
    {
        with(instance_create(0,0,ds_list_find_value(vals,0)))
        {
            x = X + (max(0,-FLIP_X) * ROOM_WIDTH) + ds_list_find_value(vals,1) * FLIP_X;
            y = Y + (max(0,-FLIP_Y) * ROOM_HEIGHT) + ds_list_find_value(vals,2) * FLIP_Y;
            image_xscale = ds_list_find_value(vals,3) * FLIP_X;
            image_yscale = ds_list_find_value(vals,4) * FLIP_Y;
            image_angle = ds_list_find_value(vals,5);
            
        }
    }
    
    ds_list_destroy(vals);
    file_text_readln(f);
}
show_debug_message("");

file_text_close(f);
return true;