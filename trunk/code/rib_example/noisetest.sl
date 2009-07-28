#include "materials.h"
surface noisetest ( float freq=10; ) 
{
 Ci = color(noise(freq*s,freq*t));
}
