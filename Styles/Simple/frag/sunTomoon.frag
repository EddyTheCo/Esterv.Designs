#version 440
#define PI 3.1415926538
#define LIGHTREP 8.0


#define BLUR 0.02
#define SUNR1 0.3
#define SUNR2 0.4
#define SUNR3 0.6
#define SUNW  0.25

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec2 pixelStep;
    float iTime;
    vec4 fcolor;
};
layout(binding = 1) uniform sampler2D src;


float Circle(vec2 uv, float r)
{
    float d = length(uv);
    float c = smoothstep(r,r-BLUR,d);
    return c;
}
float sun(float r, float a)
{
    float f= smoothstep(SUNR2-BLUR,SUNR2,r) - smoothstep(SUNR2 +(SUNR3-SUNR2)*iTime+0.01*sin(2.0*iTime)-BLUR,SUNR2 +(SUNR3-SUNR2)*iTime+0.01*sin(2.0*iTime),r);
    f*= smoothstep(0.0,BLUR,-2.0*SUNW+sin(LIGHTREP*a)-r*0.5)*iTime;
    f+=1.0-smoothstep(SUNR1-BLUR,SUNR1,r);
    return clamp(f,0.0,1.0)*(iTime);
}
float moon(vec2 uv)
{
    float f=Circle(uv,SUNR2);
    f-=Circle(uv-0.6*SUNR2*vec2(cos(PI*(0.25)),sin(PI*(0.25))),SUNR2*(1.0-iTime));
    return clamp(f,0.0,1.0)*(1.0-iTime);
}
void main( void)
{
    vec2 uv=vec2(qt_TexCoord0.x*2.0-1.0,1.0-qt_TexCoord0.y*2.0);

    float f=sun(length(uv),atan(uv.x,uv.y));

    f +=moon(uv);

    vec4 bcolor=texture(src, uv).rgba;
    vec4 color=mix(bcolor,fcolor, f);

    fragColor = color;


}

