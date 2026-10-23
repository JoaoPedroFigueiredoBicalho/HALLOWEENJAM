var _xinput = keyboard_check(vk_right) + keyboard_check(ord("D"))
            - keyboard_check(vk_left) - keyboard_check(ord("A"));

var _yinput = keyboard_check(vk_down) + keyboard_check(ord("S"))
            - keyboard_check(vk_up) - keyboard_check(ord("W"));

_xinput = clamp(_xinput, -1, 1);
_yinput = clamp(_yinput, -1, 1);

var _speed = move_speed;
if (keyboard_check(ord("Z"))) {
    _speed *= 1.5;
}

move_and_collide(_xinput * _speed, _yinput * _speed, obj_wall, 4, 0, 0, _speed, _speed);

if (_xinput != 0 || _yinput != 0) {
    if (abs(_xinput) > abs(_yinput)) {
        look_dir = (_xinput > 0) ? 0 : 2;
    } else {
        look_dir = (_yinput > 0) ? 1 : 3;
    }
}

if (!instance_exists(flashlight_id)) {
    flashlight_id = instance_create_layer(x, y, layer, obj_flashlight);
    flashlight_id.image_alpha = 0.35;
    flashlight_id.depth = depth + 1;
}

var _angle = 360 - look_dir * 90;
var _player_half_extent;
var _light_half_length;

if (look_dir == 0 || look_dir == 2) {
    _player_half_extent = sprite_get_width(sprite_index) * abs(image_xscale) * 0.5;
    _light_half_length = sprite_get_width(flashlight_id.sprite_index) * abs(flashlight_id.image_xscale) * 0.5;
} else {
    _player_half_extent = sprite_get_height(sprite_index) * abs(image_yscale) * 0.5;
    _light_half_length = sprite_get_height(flashlight_id.sprite_index) * abs(flashlight_id.image_yscale) * 0.5;
}

var _offset = _player_half_extent + _light_half_length - 2;
flashlight_id.x = x + lengthdir_x(_offset, _angle);
flashlight_id.y = y + lengthdir_y(_offset, _angle);
flashlight_id.image_angle = _angle;