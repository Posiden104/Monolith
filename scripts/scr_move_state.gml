/// scr_move_state
scr_get_input();

// Move
if(canMove){
    phy_position_x += xaxis * Global_TILESIZE;
    phy_position_y += yaxis * Global_TILESIZE;
    canMove = false;
    alarm[0] = moveWait;
}

/*
// Control the sprite
image_speed = .2;
if(len == 0) image_index = 0;

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
*/
