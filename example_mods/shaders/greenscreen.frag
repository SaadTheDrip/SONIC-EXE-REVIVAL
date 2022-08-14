#define threshold 0.55
#define padding 0.05

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    vec4 greenScreen = vec4(0.,1.,0.,1.);
    vec4 color = texture(iChannel0, uv);
    
    vec3 diff = color.xyz - greenScreen.xyz;
    float fac = smoothstep(threshold-padding,threshold+padding, dot(diff,diff));
    
    color = mix(color, texture(iChannel1, uv), 1.-fac);
	fragColor = color;
}