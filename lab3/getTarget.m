function obj=getTarget()
    cfg = getConfig();
    obj.targetsNo=4; % number of targets
    obj.v=[0, 0.225*cfg.v_max, 0.225*cfg.v_max, 0.825*cfg.v_max]; % target velocity [m/s]
    obj.r=[5e3, 10e3, 20e3, 20e3]; % targed distance [m]
end

