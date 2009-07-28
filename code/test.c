#include <ri.h>
RtPoint Square[4] = 
	{{.5,.5,.5}, {.5,-.5,.5}, 
	 {-.5,-.5,.5}, {-.5,.5,.5} };

int main(void) {
    RiBegin(RI_NULL);  
      RiDisplay("RenderMan", RI_FRAMEBUFFER, "rgb", RI_NULL);
      RiFormat((RtInt) 256, (RtInt) 192, 1.0);
      RiShadingRate(1.0);
      RiWorldBegin();
        RiSurface("plastic", RI_NULL);
        RiPolygon((RtInt)4, RI_P, (RtPointer) Square, RI_NULL);
      RiWorldEnd();
    RiEnd();            
    return 0;
}