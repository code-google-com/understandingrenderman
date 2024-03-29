surface orennayar (
 color SurfaceColor=color(0,0.5,1); 
 float Ka=1; 
 float Kd=.5; 
 float sigma=0.0; 
) 

{

point Nf, IN, Eye, LN;
color lightC = 0;
color L1, L2;
float C1, C2, C3;
float theta_r, theta_i, cos_theta_i;
float alpha, beta, sigma2, cos_phi_diff;

Nf = faceforward (normalize(N),I);
IN = normalize (I);
Eye = -IN;
theta_r = acos (Eye . Nf);
sigma2 = sigma*sigma;

illuminance (P, Nf, PI/2) {
  LN = normalize(L);
  cos_theta_i = LN . Nf;
  cos_phi_diff = normalize(Eye-Nf*(Eye.Nf)) . normalize(LN - Nf*(LN.Nf));
  theta_i = acos (cos_theta_i);
  alpha = max (theta_i, theta_r);
  beta = min (theta_i, theta_r);
  C1 = 1 - 0.5 * sigma2/(sigma2+0.33);
  C2 = 0.45 * sigma2 / (sigma2 + 0.09);

  if (cos_phi_diff >= 0)
    C2 *= sin(alpha);
  else 
    C2 *= (sin(alpha) - pow(2*beta/PI,3));

  C3 = 0.125 * sigma2 / (sigma2+0.09) * pow ((4*alpha*beta)/(PI*PI),2);
  L1 = Cs * (cos_theta_i * (C1 + cos_phi_diff * C2 * tan(beta) + (1 - abs(cos_phi_diff)) * C3 * tan((alpha+beta)/2)));
  L2 = (Cs * Cs) * (0.17 * cos_theta_i * sigma2/(sigma2+0.13) * (1 - cos_phi_diff*(4*beta*beta)/(PI*PI)));
  lightC += (L1 + L2) * Cl;
}

Ci = SurfaceColor * (Ka*ambient() + Kd*lightC);

}