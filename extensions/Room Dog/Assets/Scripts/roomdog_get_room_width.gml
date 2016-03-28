///roomdog_get_room_width(room_index_OR_room_txt_file)
var ROOM = argument0;
var ROOM_TXT_FILE;

if(string_count(".txt",string(ROOM)) > 0)
    ROOM_TXT_FILE = ROOM;
else
    ROOM_TXT_FILE = "roomChunks\" + room_get_name(ROOM) + ".txt";

if(ds_list_find_index(RoomChunkManager.fileChunks, ROOM_TXT_FILE) != -1)
{
    return ds_map_find_value(RoomChunkManager.roomWidths, ROOM_TXT_FILE);
}
else
{
    show_debug_message("room file "+ ROOM_TXT_FILE +" not found!");
    return -1;
}