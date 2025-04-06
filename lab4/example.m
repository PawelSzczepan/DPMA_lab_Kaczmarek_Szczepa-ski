clear
clc
close all

targetsList=getTargets(1);
cfg=getConfig();

simulationsNo=1e6;
detectionThresholdVector=[0:0.1:20];
probabilityDetectionVec=zeros(size(detectionThresholdVector));
ProbabilityFalseAlarmVec=zeros(size(detectionThresholdVector));

targetsNo=length(targetsList); % there is just one target

figure
for simulationIdx=1:simulationsNo
    rangeProfile=getProfile(targetsList); % creating profile with random noise
    [cfar_go, signSquared]=CFAR_GO(rangeProfile); % calculating CFAR thresholds vector
    for k=1:length(detectionThresholdVector) % loop over each detection threshold (it's quicker)
        threshold=detectionThresholdVector(k);
        detections=(signSquared > cfar_go*threshold ); % making decision about detetion
        if detections(targetsList(1).distCell) == 1 % checking true detection % requires multiple targets extension
            probabilityDetectionVec(k)= ((simulationIdx-1)*probabilityDetectionVec(k)+1)/simulationIdx;
            detections(targetsList(1).distCell)=0;
        end
        ProbabilityFalseAlarmVec(k)= ((simulationIdx-1)*ProbabilityFalseAlarmVec(k)+sum(detections)/(cfg.pulseSamplesNo-targetsNo))/simulationIdx; % handling false alarm % requires multiple targets extension
    end
    if mod(simulationIdx,1000)==0 % refresh rate
        loglog(ProbabilityFalseAlarmVec, probabilityDetectionVec)
        hold on
        for textIdx=1:10:length(detectionThresholdVector);
            textStr=['Thr= ' num2str(detectionThresholdVector(textIdx))];
            text(ProbabilityFalseAlarmVec(textIdx), probabilityDetectionVec(textIdx), textStr)
            plot(ProbabilityFalseAlarmVec(textIdx), probabilityDetectionVec(textIdx), 'ro')
        end
        xlabel('ProbabilityFalseAlarmVec')
        ylabel('probabilityDetectionVec')
        grid on
        hold off
        drawnow
        simulationIdx
    end
end



%plot(dp, rangeProfile);
