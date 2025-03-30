function rxSignal=channelOutput_better(inputSignal, target)
    cfg=getConfig();

    rxSignal=zeros(1,cfg.M*cfg.pulseSamplesNo*2);
    for k=1:target.targetsNo
        R=target.r(k);
        deltaT=2*R/cfg.c;
        deltaN=deltaT*cfg.Fs
        V=target.v(k);
        fr=2*V*cfg.fc/cfg.c
        frVec=exp(j*2*pi*fr*(1:length(inputSignal))/cfg.Fs);
        inputSignal=[zeros(1,round(deltaN)) inputSignal.*frVec];
        shortenedSignal=resample(inputSignal, round(cfg.Fs*(1+round(fr)/cfg.fc)), cfg.Fs);
        rxSignal([1:length(shortenedSignal)])=rxSignal([1:length(shortenedSignal)])+shortenedSignal;
    end
end

