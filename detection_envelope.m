function det_env = detection_envelope(sig)
hil_sig = abs(hilbert(sig));
%hil_sig = hil_sig-mean(hil_sig);
hil_sig = sig;
mold = 0.0;
% det_env = hil_sig;
fmax = 1/500;
c = 1-fmax;
%rc = 50;%时间常数
n = length(hil_sig);
for i=1:n
    if hil_sig(i) > mold
        mold = hil_sig(i);
    else
       %mold = mold *(rc/(rc + 1));
       mold = mold * c;
    end
    det_env(i) = mold; 
end
