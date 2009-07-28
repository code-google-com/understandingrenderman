surface textured_noise ( float freq=100; ) 
{
 Ci = texture("texture.tx", s, t)*noise(freq*s,freq*t);
}
