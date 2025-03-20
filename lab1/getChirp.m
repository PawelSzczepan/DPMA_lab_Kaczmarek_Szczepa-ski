function out=getChirp(f_low, f_high, duration)
    cfg=getConfig();
    tVec=(1:duration*cfg.Fs)/cfg.Fs;
    out=exp(tVec.*(f_low+0.5*f_high*tVec/duration)*j*2*pi);
end
