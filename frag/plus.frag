#version 440
#define PI     3.14159265
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec2 pixelStep;
    vec4 fcolor;
    float time;
};
layout(binding = 1) uniform sampler2D src;

float udSegment( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 ba = b-a;
    vec2 pa = p-a;
    float h =clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length(pa-h*ba);
}

float plus(in vec2 p,float rot)
{
    float th = 0.1;
    vec2 v1 = 0.3*vec2(1.0,0.0);
    vec2 v3 = 0.3*vec2(sin(PI*rot),-cos(PI*rot));

    float d1 = udSegment( p, v1, -v1 ) - th;

    float d2 = udSegment( p, v3, -v3 ) - th;

    return 1.0 - sign(d1) - sign(d2);
}
void main( void)
{
    vec2 uv = 2.0*qt_TexCoord0-1.0;


    float f=plus(uv,time);

    vec4 bcolor=texture(src, uv).rgba;
    vec4 color=mix(bcolor, fcolor, f);

    fragColor = color;


}
