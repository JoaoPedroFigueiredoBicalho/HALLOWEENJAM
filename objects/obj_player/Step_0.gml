var move_x = 0;
var move_y = 0;

if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
    move_x += 1;
}
if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
    move_x -= 1;
}
if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
    move_y += 1;
}
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
    move_y -= 1;
}

var input_length = point_distance(0, 0, move_x, move_y);
if (input_length > 0) {
    move_x /= input_length;
    move_y /= input_length;
}

x += move_x * move_speed;
y += move_y * move_speed;