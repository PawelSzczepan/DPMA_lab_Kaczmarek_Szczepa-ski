function obj=getCustomTarget(veloctiy_vec, distance_vec)
    obj.targetsNo=length(distance_vec); % number of targets
    obj.v=veloctiy_vec; % target velocity [m/s]
    obj.r=distance_vec; % target distance [m]
end