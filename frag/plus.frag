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

float sdOrientedBox( in vec2 p, in vec2 a, in vec2 b, float th )
{
    float l = length(b-a);
    vec2  d = (b-a)/l;
    vec2  q = p-(a+b)*0.5;
    q = mat2(d.x,-d.y,d.y,d.x)*q;
    q = abs(q)-vec2(l*0.5,th);
    return length(max(q,0.0)) + min(max(q.x,q.y),0.0);
}


void main( void)
{
    vec2 uv = 2.0*qt_TexCoord0-1.0;
    uv.x*= pixelStep.y/pixelStep.x;

    vec2 v1still = 0.5*vec2(-1.0,0.0);

    float th = 0.02;

    float dstill = sdOrientedBox( uv, v1still, -v1still, th);

    dstill = pow((0.1) / smoothstep(0.0,0.25,dstill), 3.0);
    vec2 v1 = 0.5*vec2(sin(PI*time),-cos(PI*time));

    float d = sdOrientedBox( uv, v1, -v1, th );

    d = pow((0.1) / smoothstep(0.0,0.25,d), 3.0);
    d = clamp(d +  dstill,0.0,1.0);

    vec4 bcolor=texture(src, uv).rgba;
    vec4 color=mix(bcolor,fcolor , d);


    fragColor = color;



}
