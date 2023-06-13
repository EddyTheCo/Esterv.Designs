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

    vec2 v1 = 0.8*vec2(1.0-time,time);

    vec2 v2 = 0.8*vec2(time,time-1.0);
    float th = 0.05-0.025*time;

    float d1 = sdOrientedBox( uv, v1, v2,th );
    d1 = pow((0.1) / (smoothstep(0.0,1.0,d1)+0.1), 4.0);


    vec2 v3 = -0.8*vec2(time,time-1.0);

    float d2 = sdOrientedBox( uv, v1, v3,th );
    d2 = pow((0.1) / (smoothstep(0.0,1.0,d2)+0.1), 4.0);

    d1 = clamp(d1 +  d2,0.0,1.0);


    vec4 bcolor=texture(src, qt_TexCoord0).rgba;
    vec4 color=mix(bcolor,fcolor , d1);

    fragColor = color;

}
