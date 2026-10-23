var _xinput = keyboard_check(vk_right) + keyboard_check(ord("D"))
            - keyboard_check(vk_left) - keyboard_check(ord("A"));

var _yinput = keyboard_check(vk_down) + keyboard_check(ord("S"))
            - keyboard_check(vk_up) - keyboard_check(ord("W"));

_xinput = clamp(_xinput, -1, 1);
_yinput = clamp(_yinput, -1, 1);

move_and_collide(_xinput * move_speed, _yinput * move_speed, obj_wall, 4, 0, 0, move_speed, move_speed);