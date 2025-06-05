function cfg=getConfig()
    cfg.c=299792458;
    cfg.Fc=4e8; % carrier frequency
    cfg.Fs=.1e6; % sampling frequency
    cfg.M=10; % number of consecutive pulses
    cfg.PRF=5000; % pulse repetition frequency
    cfg.pulseSamplesNo=round(cfg.Fs/cfg.PRF); % number of samples in single pulse
    cfg.PRF=cfg.Fs/cfg.pulseSamplesNo; % pulse repetition frequency
    cfg.Tp=1/cfg.PRF; % pulse period
    cfg.Tf=cfg.Tp*cfg.M; % total frame time
    cfg.r_max=0.5*cfg.c/cfg.PRF; % max unambiguous range
    cfg.v_max=cfg.PRF/cfg.Fc*cfg.c/4; % max unambiguous velocity (+/-v_max)
end
