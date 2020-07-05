function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza
  %valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  % calculez coeficientii a si b pentru functia
  % membru
  a = 1 / (val2 - val1);
  b = - a * val1;
  % in acest if vad pe ce ramura se gaseste x si ii aplic functia membru
  if x < val1
      y = 0;
    elseif x >= val1 && x <= val2
      y = a * x + b;
    else
      y = 1;
  end
endfunction