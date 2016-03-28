///infinitydog_wrap_room()

/*
    Run this script in one object's step event.
    
    The room must have views enabled and the room
    must be at least 160 pixels wider and taller
    (based on the variables X_BUFFER and Y_BUFFER
    below) than the view rectangle.
*/

var VIEW_WIDTH = view_wview[view_current];
var VIEW_HEIGHT = view_hview[view_current];

var VIEW_LEFT = view_xview[view_current];
var VIEW_RIGHT = view_xview[view_current] + VIEW_WIDTH;
var VIEW_TOP = view_yview[view_current];
var VIEW_BOTTOM = view_yview[view_current] + VIEW_HEIGHT;

var VIEW_CENTER_X = VIEW_LEFT + VIEW_WIDTH/2;
var VIEW_CENTER_Y = VIEW_TOP + VIEW_HEIGHT/2;

// adjust these to be smaller for smaller rooms
var X_BUFFER = 80;
var Y_BUFFER = 80;

// wrap X
if( abs(room_width - VIEW_RIGHT) < X_BUFFER )
{
    with(all)
    {
        x -= X_BUFFER;
        if(x < 0)
            x += room_width;
    }
        
    view_xview[view_current] -= X_BUFFER;
}
else if( abs(VIEW_LEFT) < X_BUFFER )
{
    with(all)
    {
        x += X_BUFFER;
        if(x > room_width)
            x -= room_width;
    }
        
    view_xview[view_current] += X_BUFFER;
}

// wrap Y
if( abs(room_height - VIEW_BOTTOM) < Y_BUFFER )
{
    with(all)
    {
        y -= Y_BUFFER;
        if(y < 0)
            y += room_height;
    }
        
    view_yview[view_current] -= Y_BUFFER;
}
else if( abs(VIEW_TOP) < Y_BUFFER )
{
    with(all)
    {
        y += Y_BUFFER;
        if(y > room_height)
            y -= room_height;
    }
        
    view_yview[view_current] += Y_BUFFER;
}
