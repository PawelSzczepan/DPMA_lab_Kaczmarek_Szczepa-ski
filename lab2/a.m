function out=a(PhiDeg,ArrayPattern,ArrayTaper=[])
    if length(ArrayTaper)==0
        out=exp(j*ArrayPattern*pi*sin(PhiDeg*pi/180));
        return;
    end
    out=ArrayTaper.*exp(j*ArrayPattern*pi*sin(PhiDeg*pi/180));
end
