#define CURRENT_SHADER_NAME "mms_sheep_phong1"
#define DEFAULT_FILTER "gaussian"
#define TEX_4_PT
#include <maya_magic_shaders.h>
surface mms_sheep_phong1(
	float a_0_MayaManReflSamps = 1;
	float a_0_MayaManReflBlur = 0;
	float a_0_MayaManRefrSamps = 1;
	float a_0_MayaManRefrBlur = 0;
	varying color a_0_reflectedColor = color(0,0,0);
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
    color v_0_color = color(1,1,1);
#define v_0_ambientColor color(0,0,0)
#define v_0_specularColor color(0.5,0.5,0.5)
#define v_0_cosinePower 20
#define v_0_reflectivity 0.5
    color v_0_reflectedColor = a_0_reflectedColor;
    normal v_0_normalCamera;
#define v_0_refractionLimit 6
#define v_0_refractiveIndex 1
#define v_0_refractions 0
#define v_0_translucence 0
#define v_0_translucenceFocus 0.5
#define v_0_translucenceDepth 0.5
#define v_0_incandescence color(0,0,0)
#define v_0_matteOpacity 1

    PROFILE("SETUP 0 PHONG");
    PHONG_SETUP(v_0_);
    if(only_do_opacity == 0) {
    }
    PROFILE("SIMULATE 0 PHONG");
    PHONG_SIM(v_0_);

    Ci = v_0_outColor;
    Oi = Os;
  }
  DEEP_SHADOW_OPACITY_HANDLER
  PROFILE("end");
  SURFACE_DEBUG_HOOK
}
