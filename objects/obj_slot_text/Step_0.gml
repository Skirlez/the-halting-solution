var keep_sign = sign(vspeed)
vspeed -= sign(vspeed) * 0.4;
if sign(vspeed) != keep_sign
	vspeed = 0;