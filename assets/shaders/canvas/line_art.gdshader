shader_type canvas_item;

uniform float strength = 0.01;
uniform vec4 color : source_color;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec3 current_color = texture(SCREEN_TEXTURE, SCREEN_UV).rgb;
	vec3 right_color = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x, 0)).rgb;
	vec3 bottom_color = texture(SCREEN_TEXTURE, SCREEN_UV - vec2(0, SCREEN_PIXEL_SIZE.y)).rgb;
	float r_distance = length(current_color - right_color);
	float b_distance = length(current_color - bottom_color);

	vec4 sobel = (r_distance > strength || b_distance > strength) ? color : vec4(0);

	COLOR = sobel;
}
