shader_type canvas_item;
uniform vec2 direction = vec2(0.1, 0);
uniform float speed = 0.000001;
global uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 NEW_UV = UV + vec2(sin(TIME)/100.0,cos(TIME)/100.0);
	COLOR = texture(noise,NEW_UV) - vec4(0.5,0.5,0.4,0.0);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
