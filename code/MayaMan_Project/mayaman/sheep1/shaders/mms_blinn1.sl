#define CURRENT_SHADER_NAME "mms_blinn1"
#define DEFAULT_FILTER "gaussian"
#define TEX_4_PT
#include <maya_magic_shaders.h>
surface mms_blinn1(
	float a_0_MayaManReflSamps = 1;
	float a_0_MayaManReflBlur = 0;
	float a_0_MayaManRefrSamps = 1;
	float a_0_MayaManRefrBlur = 0;
	varying color a_0_reflectedColor = color(0,0,0);
	float a_1_placementMatrix[16] = {1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};
	float a_2_worldMatrix[16] = {1,0,0,0,  0,1,0,0,  0,0,1,0,  0,0,0,1};
	ALL_SURFACE_ARGS;
	PREF_VAR;)
{
  PROFILE("begin");
#pragma nolint
  SURFACE_TEMPS;
  APPLY_SLICE_PLANE else {
    color v_0_transparency = color(0,0,0);
#define v_0_reflectionLimit 1
    uniform float v_0_MayaManReflSamps = a_0_MayaManReflSamps;
    uniform float v_0_MayaManReflBlur = a_0_MayaManReflBlur;
    uniform float v_0_MayaManRefrSamps = a_0_MayaManRefrSamps;
    uniform float v_0_MayaManRefrBlur = a_0_MayaManRefrBlur;
#define v_0_diffuse 0.8
    color v_0_color;
#define v_0_ambientColor color(0,0,0)
#define v_0_specularColor color(0.5,0.5,0.5)
#define v_0_reflectivity 0.5
    color v_0_reflectedColor = a_0_reflectedColor;
#define v_0_specularRollOff 0.7
#define v_0_eccentricity 0.3
#define v_0_incandescence color(0,0,0)
    normal v_0_normalCamera;
#define v_0_refractionLimit 6
#define v_0_refractiveIndex 1
#define v_0_refractions 0
#define v_0_translucence 0
#define v_0_translucenceFocus 0.5
#define v_0_translucenceDepth 0.5
#define v_0_matteOpacity 1
    matrix v_1_placementMatrix = MTX_CVT(a_1_placementMatrix,0);
#define v_1_local 0
#define v_1_scale 0
#define v_1_origin 0
#define v_1_lacunarity 4
#define v_1_increment 0.1
#define v_1_octaves 3
#define v_1_weight3d vector(1,1,1)
#define v_1_alphaIsLuminance 0
#define v_1_colorGain color(1,1,1)
#define v_1_colorOffset color(0,0,0)
#define v_1_alphaGain 1
#define v_1_alphaOffset 0
#define v_1_defaultColor color(0.5,0.5,0.5)
#define v_1_invert 0
#define v_2_worldMatrix_n 1
    uniform matrix v_2_worldMatrix[1];
    v_2_worldMatrix[0] = MTX_CVT(a_2_worldMatrix,0);
#define v_2_inheritsTransform 1

    PROFILE("SETUP 0 BLINN");
    BLINN_SETUP(v_0_);
    if(only_do_opacity == 0) {
      PROFILE("SETUP 1 BROWNIAN");
      BROWNIAN_SETUP(v_1_);
      PROFILE("SETUP 2 PLACE3DTEXTURE");
      PLACE3DTEXTURE_SETUP(v_2_);
      PROFILE("SIMULATE 2 PLACE3DTEXTURE");
      PLACE3DTEXTURE_SIM(v_2_);

      v_1_placementMatrix  = v_2_worldInverseMatrix[0];
      PROFILE("SIMULATE 1 BROWNIAN");
      BROWNIAN_SIM(v_1_);

      v_0_color            = color(v_1_outColor);
    }
    PROFILE("SIMULATE 0 BLINN");
    BLINN_SIM(v_0_);

    Ci = v_0_outColor;
    Oi = Os;
  }
  DEEP_SHADOW_OPACITY_HANDLER
  PROFILE("end");
  SURFACE_DEBUG_HOOK
}
