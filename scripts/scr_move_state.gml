/// scr_move_state
scr_get_input();

<<<<<<< HEAD
=======
// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the length
if(xaxis == 0 && yaxis == 0) {
    image_speed = 0;
    image_index = 0;
    len =0;
} else {
    // Player is moving
    image_speed = .2;
    len = spd;
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

>>>>>>> 1ac9d0fcaf6b9af0059f06d73ab55f26bc315458
// Move
if(canMove){
    phy_position_x += xaxis * Global_TILESIZE;
    phy_position_y += yaxis * Global_TILESIZE;
    canMove = false;
    alarm[0] = moveWait;
}


// Control the sprite

// Vertical sprites
if(vspd > 0) {
    sprite_index = spr_player_down;
} else if(vspd < 0) {
    sprite_index = spr_player_up;
}

// Horizontal sprites
if(hspd > 0) {
    sprite_index = spr_player_right;
} else if(hspd < 0) {
    sprite_index = spr_player_left;
}

