function obj=getTarget()
    cfg = getConfig();
    obj.targetsNo=2; % number of targets
    obj.v=[0, 3.525*cfg.v_max]; % target velocity [m/s]
    obj.r=[5e3, 15e3]; % targed distance [m]
end

