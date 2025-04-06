function targets=getTargets(targetIdx)
    cfg=getConfig();

    if targetIdx==1
        targets.dist=15e3;
        targets.snr=6;
    elseif targetIdx==2
        targets.dist=[15e3 20e3];
        targets.snr=[6 10];
    elseif targetIdx==3
        targets.dist=[15e3 16e3];
        targets.snr=[12 20];
    end

    targets.distCell=round(mod(targets.dist/cfg.cellSize,cfg.pulseSamplesNo));
    targets.amplitude=10.^(targets.snr/20)*sqrt(cfg.noiseVariance);
end

