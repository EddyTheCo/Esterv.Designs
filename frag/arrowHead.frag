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

float arrow(in vec2 p,float rot)
{
    vec2 v1 = 0.8*vec2(1.0-rot,rot);

    vec2 v2 = 0.8*vec2(rot,rot-1.0);
    float th = 0.1-0.03*rot;

    float d1 = udSegment( p, v1, v2 ) - th;

    vec2 v3 = -0.8*vec2(rot,rot-1.0);

    float d2 = udSegment( p, v1, v3 ) - th;


    return 1.0 - sign(d1) - sign(d2);
}
void main( void)
{
        //vec2 uv=qt_TexCoord0;

        vec2 uv = 2.0*qt_TexCoord0-1.0;

        //uv.x*=pixelStep.x/pixelStep.y;

        float f=arrow(uv,time);

        vec4 bcolor=texture(src, uv).rgba;
        vec4 color=mix(bcolor, fcolor, f);

        fragColor = color;
       //fragColor=vec4(uv.x,0.0,0.0,1.0);

}
