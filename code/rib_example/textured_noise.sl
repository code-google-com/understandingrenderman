surface textured_noise ( float freq=100; ) 
{
 Ci = texture("texture.tif", s, t)*noise(freq*s,freq*t);
}
