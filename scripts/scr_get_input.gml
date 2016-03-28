/// scr_get_input
rkey = keyboard_check(vk_right);
ukey = keyboard_check(vk_up);
lkey = keyboard_check(vk_left);
dkey = keyboard_check(vk_down);


// Get the axis
xaxis = (rkey - lkey);
yaxis = (dkey - ukey);

// Check for gamepad input
/*    if(gamepad_is_connected(0)) {
        gamepad_set_axis_deadzone(0, .35);
        xaxis = gamepad_axis_value(0, gp_axislh);
        yaxis = gamepad_axis_value(0, gp_axislv);
    }
*/



