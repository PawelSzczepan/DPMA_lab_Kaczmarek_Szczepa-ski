function cfg=getConfig()
    cfg.c=299792458;
    cfg.Fs=2e6; % sampling frequency
    cfg.PRF=3000; % pulse repetition frequency
    cfg.Tp=1/cfg.PRF; % pulse period
    cfg.cellSize=0.5*cfg.c/cfg.Fs; % distance of single sample
    cfg.pulseSamplesNo=round(cfg.Tp*cfg.Fs); % number of samples
    cfg.r_max=cfg.pulseSamplesNo*cfg.cellSize; % max unambiguous range
    cfg.noiseVariance=1; % noise variance
    cfg.guardCells=5;
    cfg.testCells=20;
end
