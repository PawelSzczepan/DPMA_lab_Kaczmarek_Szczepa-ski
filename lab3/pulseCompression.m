function [pulses, distVector]=pulseCompression(rxSignal)
    cfg=getConfig();
    [out, singleChirp]=getTxSignal();
    [distProfile,lag]=xcorr(rxSignal,singleChirp);
    distVector=[1:cfg.pulseSamplesNo]/cfg.Fs*cfg.c/2;
    zeroLag=find(lag==0);
    pulses=zeros(cfg.M,cfg.pulseSamplesNo);
    for m=1:cfg.M
        pulses(m,:)=distProfile([1:cfg.pulseSamplesNo]+zeroLag+(m-1)*cfg.pulseSamplesNo);
    end
end

