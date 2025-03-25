shader_type canvas_item;
uniform sampler2D filter_on : filter_nearest;
global uniform sampler2D Star;
uniform float Charge;
const vec4 white = vec4(1,1,1,1);
void fragment() {
	vec4 StarText = texture(TEXTURE,UV);
	if (StarText == white){
			StarText.g = 1.0;
			StarText.b = 0.0;
			StarText.r = 0.0;
		if (Charge > 50.0)
		{StarText.g = 1.0 - ((Charge - 50.0) / 50.0);StarText.r = 1.0;}
		else {StarText.r = Charge / 50.0;}
		}
	COLOR = StarText;
	// Called for every pixel the material is visible on.
}

