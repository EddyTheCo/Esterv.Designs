#version 440

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

float Circle(vec2 uv,vec2 p, float r,float blur)
{
        float d = length(uv-p);
        float c = smoothstep(r,r-blur,d);
        return c;
}
float CircleBand(vec2 uv,vec2 p, float r,float d,float blur)
{
    float mask1=Circle(uv,p,r+d,blur);
    float mask2=Circle(uv,p,r,blur);
    return mask1-mask2;
}
float engranage(vec2 uv, vec2 point, float angle)
{
    vec2 pos= point-uv;
    float r=length(pos)*2.0;
    float a=atan(pos.y,pos.x);

    float f=smoothstep(-0.8,0.5,cos((a-angle)*10.0))*0.15+0.5;

    f= 1.0-smoothstep(f,f+0.01,r);
    f=f*(1.0-Circle(uv-point,pos,0.25,0.01));

    f=f*(1.0-CircleBand(uv-point,pos,0.35,0.05,0.01));
    return f;
}

void main( void)
{
        vec2 uv=qt_TexCoord0;
        uv.x *= pixelStep.y/pixelStep.x;

        float x=pixelStep.y/pixelStep.x;

        //float xpos=mod((time*0.5+x*0.7),x*1.5)-x*0.2;
        vec2 point=vec2(x*0.5,0.5);


        float f=engranage(uv,point,time*3.0);

        vec4 bcolor=texture(src, uv).rgba;
        vec4 color=mix(bcolor, fcolor, f);

        fragColor = color;

}
