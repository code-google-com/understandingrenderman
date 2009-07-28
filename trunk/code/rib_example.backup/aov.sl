surface aov ( float freq=100; 
              output varying color tex = 0;
              output varying float noi = 0;) 
{
 tex = texture("texture.tx", s, t);
 noi = noise(freq*s,freq*t);

 Ci = tex*noi;
}
