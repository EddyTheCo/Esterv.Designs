// Copyright © 2014 Inigo Quilez


#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec2 pixelStep;
    vec4 fcolor;
    float iTime;
    float mult;
};
layout(binding = 1) uniform sampler2D src;

float hash1( float n ) { return fract(sin(n)*43758.5453); }
vec2  hash2( vec2  p ) { p = vec2( dot(p,vec2(127.1,311.7)), dot(p,vec2(269.5,183.3)) ); return fract(sin(p)*43758.5453); }

// The parameter w controls the smoothness
vec4 voronoi( in vec2 x, float w )
{
    vec2 n = floor( x );
    vec2 f = fract( x );

    vec4 m = vec4( 8.0, 0.0, 0.0, 0.0 );
    for( int j=-2; j<=2; j++ )
        for( int i=-2; i<=2; i++ )
        {
            vec2 g = vec2( float(i),float(j) );
            vec2 o = hash2( n + g );

            // animate
            o = 0.5 + 0.5*sin( iTime + 6.2831*o );

            // distance to cell
            float d = length(g - f + o);

            // cell color
            vec3 col = 0.5 + 0.5*sin( hash1(dot(n+g,vec2(7.0,113.0)))*2.5 + 3.5 + vec3(2.0,3.0,0.0));
            // in linear space
            col = col*col;

            // do the smooth min for colors and distances
            float h = smoothstep( -1.0, 1.0, (m.x-d)/w );
            m.x   = mix( m.x,     d, h ) - h*(1.0-h)*w/(1.0+3.0*w); // distance
            m.yzw = mix( m.yzw, col, h ) - h*(1.0-h)*w/(1.0+3.0*w); // color
        }

    return m;
}
float trapezoid(float x, float d)
{
    if(x>d&&x<1.0-d)return 1.0;
    
    if(x<=d)return x/d;
    
    if(x>=1.0-d)return (1.0-x)/d;
    
}
void main( void)
{
    vec2 p=qt_TexCoord0;

    vec4 v = voronoi( p*mult, 0.0);

    vec4 bcolor=texture(src, p).rgba;
    vec4 col = mix(bcolor,vec4(1.0,1.0,0.5,1.0),v.w*(1.0-bcolor.a));


    fragColor = col* qt_Opacity;


}
