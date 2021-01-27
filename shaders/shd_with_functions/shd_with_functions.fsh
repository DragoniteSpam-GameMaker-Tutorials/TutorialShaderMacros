//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 invert_color(vec3 original_color);
void invert_color_by_myself(inout vec4 original_color);

#ifdef _YY_HLSL11_
#define GREEN_VALUE invert_color(vec3(0.0, 128.0 / 255.0, 255.0 / 255.0))
#else
#define GREEN_VALUE vec3(0.0, 128.0 / 255.0, 255.0 / 255.0)
#endif

#define INVERT_COLOR(c) vec3(1.0 - c.r, 1.0 - c.g, 1.0 - c.b)
/*
#ifndef GREEN_VALUE
#else
#endif
*/

//#undef INVERT_COLOR

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    //invert_color_by_myself(color);
    
    color.rgb = GREEN_VALUE;
    
    
    gl_FragColor = color;
}

vec3 invert_color(vec3 original_color) {
    return vec3(1.0 - original_color.r, 1.0 - original_color.g, 1.0 - original_color.b);
}

void invert_color_by_myself(inout vec4 original_color) {
    original_color.r = 1.0 - original_color.r;
    original_color.g = 1.0 - original_color.g;
    original_color.b = 1.0 - original_color.b;
}