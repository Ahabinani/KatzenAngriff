shader_type canvas_item;
uniform vec2 direction = vec2(0.1, 0);
uniform float speed = 0.000001;
global uniform sampler2D noise;

vec4 overlay(vec4 base, vec4 blend){
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

void fragment()
{
	// image texture
	vec4 base = texture(TEXTURE, UV);
	// noise texture

	vec4 blend = texture(noise, 0.2 * (UV + ( direction * speed * mod(TIME,30))));
	
	COLOR = overlay(base, blend);
}