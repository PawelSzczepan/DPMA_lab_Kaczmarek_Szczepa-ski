function [txSignal, singleChirp]=getTxSignal()
    cfg=getConfig();
    f_low=cfg.Fs/4;
    f_high=cfg.Fs*3/4;
    f_delta=f_high-f_low;
    duration=cfg.Tp*0.1;
    tVec=(1:duration*cfg.Fs)/cfg.Fs;
    singleChirp=exp(tVec.*(f_low+0.5*f_delta*tVec/duration)*j*2*pi);
    txSignal=zeros(1,cfg.M*cfg.pulseSamplesNo);
    for m=1:cfg.M
        txSignal([1:length(tVec)]+(m-1)*cfg.pulseSamplesNo)=singleChirp;
    end
end
