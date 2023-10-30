#version 440
#define PI     3.14159265
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec2 pixelStep;
    vec4 fcolor;
    float hovered;
};
layout(binding = 1) uniform sampler2D src;

float sdRoundedX( in vec2 p, in float w, in float r )
{
    p = abs(p);
    return length(p-min(p.x+p.y,w)*0.5) - r;
}


void main( void)
{
    vec2 uv=qt_TexCoord0-0.5;

    float w=0.25-hovered;
    float r=0.03-0.03*hovered/0.3;
    float d1 = 1.0-smoothstep(-0.001,0.001,sdRoundedX( uv, w, r ));

    vec4 bcolor=texture(src, uv).rgba;
    vec4 color=mix(bcolor,fcolor , d1);

    fragColor = color;

}
