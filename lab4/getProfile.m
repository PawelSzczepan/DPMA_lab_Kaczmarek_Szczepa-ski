function [signalProfile, distProfile]=getProfile(target=[])
    cfg=getConfig();

    signalProfile=crandn([1 cfg.pulseSamplesNo])/sqrt(2);

    for k=1:length(target)
        signalProfile(target(k).distCell)=signalProfile(target(k).distCell)+ target(k).amplitude;
    end
    distProfile=[1:cfg.pulseSamplesNo]*cfg.cellSize;
end

