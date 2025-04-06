function [CFAR_GO_vec, signalProfileSquared]=CFAR_GO(signalProfile)
    cfg=getConfig();

    L=length(signalProfile);
    signalProfileSquared=abs(signalProfile).^2;

    CRAF_R=zeros(size(signalProfileSquared));
    CRAF_L=zeros(size(signalProfileSquared));
    movWindow=[zeros(1,cfg.guardCells+1) ones(1,cfg.testCells) zeros(1,cfg.guardCells+1)];

    convSignal=conv(signalProfileSquared, movWindow);
    CRAF_L=convSignal(1:L);
    CFAR_R=convSignal(end-L+1:end);
    CFAR_GO_vec=max(CRAF_L,CFAR_R)/cfg.testCells;

end

