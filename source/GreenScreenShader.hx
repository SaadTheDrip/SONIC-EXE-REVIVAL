package;

import flixel.system.FlxAssets.FlxShader;
import openfl.display.BitmapData;
import openfl.display.ShaderInput;
import openfl.utils.Assets;
import flixel.FlxG;
import openfl.Lib;



class GreenScreenShader extends FlxShader // https://www.shadertoy.com/view/ldjGzV and https://www.shadertoy.com/view/Ms23DR and https://www.shadertoy.com/view/MsXGD4 and https://www.shadertoy.com/view/Xtccz4
{

  @:glFragmentSource('
  //SHADERTOY PORT FIX
  #pragma header
  vec2 uv = openfl_TextureCoordv.xy;
  vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
  vec2 iResolution = openfl_TextureSize;
  uniform float iTime;
  #define iChannel0 bitmap
  #define texture flixel_texture2D
  #define fragColor gl_FragColor
  #define mainImage main
  //SHADERTOY PORT FIX
  
  
  #define PI 3.1415926535
  
  // chromakey from here https://www.shadertoy.com/view/MsS3DW
  // this buffer just makes alpha mask
  
  float th = 8.0; // threshold
  float a2 = 1.2;
  float spill = 1.0;
  
  
  float getAlpha(vec4 c){
      // First Vlahos assumption: Gf <= a2Bf	
      return 1.0 - th*(c.g-a2*(max(c.r,c.b)));
      }
  
  vec4 despill(vec4 c){
      /// Second Vlahos assumption: max (Gf - Bf,0) <= max(Bf - Rf, 0)
      float sub = max(c.g - mix(c.b, c.r, 0.45), 0.0);
      c.g -= sub;
      
      /// 
      c.a -= smoothstep(0.25, 0.5, sub*c.a);
      
      //restore luminance (kind of, I slightly reduced the green weight)
      float luma = dot(c.rgb, vec3(0.350, 0.587,0.164));
      c.r += sub*c.r*2.0*.350/luma;
      c.g += sub*c.g*2.0*.587/luma;
      c.b += sub*c.b*2.0*.164/luma;
        c.a += sub*c.g*2.0*.587/luma;
  
  
      return c;
      }
  
  
  void mainImage() {
  
          vec2 uv = fragCoord / iResolution.xy;
      float circle = 1.0;
      
      vec3 target = vec3(0.0, 1.0, 0.0); // Find green
      vec3 background = vec3(0.0, 0.0, 0.0);
      highp vec3 color;
      
  
      float threshold = 0.7; // Controls target color range
      float softness = 0.1; // Controls linear falloff
      
      // Background color key
      vec4 col = texture(iChannel0, uv);
      float diff = distance(col.xyz, target.xyz) - threshold;
      float factor = clamp(diff / softness, 0.0, 1.0);
  
      
  
      fragColor = vec4(mix(background, col.xyz, factor), 0.1);
      
      
      
  ')
  public function new()
  {
    super();
  }
}
