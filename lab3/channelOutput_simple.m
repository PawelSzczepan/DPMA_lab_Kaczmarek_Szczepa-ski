function rxSignal=channelOutput_simple(inputSignal, target)
    cfg=getConfig();

    rxSignal=zeros(1,cfg.M*cfg.pulseSamplesNo*2);
    for k=1:target.targetsNo
        V=target.v(k);
        fr=2*V*cfg.Fc/cfg.c;
        frVec=exp(j*2*pi*fr*(1:length(inputSignal))/cfg.Fs);
        for n=1:length(inputSignal)
            m = round((n/length(inputSignal))*cfg.M);
            R=target.r(k)+V*m*length(inputSignal)/cfg.Fs;
            deltaT=2*R/cfg.c;
            deltaN=deltaT*cfg.Fs;
            rxSignal([1:length(inputSignal)]+round(deltaN))=rxSignal([1:length(inputSignal)]+round(deltaN))+inputSignal.*frVec;
        end
    end
end

