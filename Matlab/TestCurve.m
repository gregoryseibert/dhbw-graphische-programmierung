load('curve.mat');

RFL = calcCurveRadiuses(vrl, vrr, 1.53, 2.65);

plotCurveData(tv, vfl, vfr, vrl, vrr, sw, RFL, tq, q);

function RFL = calcCurveRadiuses(vx, vy, W, B)
    RRL = W./((vx./vy)-1);
    RFL = sqrt(B^2 + RRL.^2);
end

function [] = plotCurveData(tv, vfl, vfr, vrl, vrr, sw, RFL, tq, q)
    figure

    subplot(5,2,[1 2]);
    plot(tv, vfl, tv, vfr, tv, vrl, tv, vrr);
    title('v overlay');

    subplot(5,2,3);
    plot(tv, vfl);load('curve.mat')
    title('v front left');

    subplot(5,2,4);
    plot(tv, vfr);
    title('v front right');

    subplot(5,2,5);
    plot(tv, vrl);
    title('v rear left');

    subplot(5,2,6);
    plot(tv, vrr);
    title('v rear right');

    subplot(5,2,[7 8]);
    plot(tv, sw);
    title('steering wheel signal');

    subplot(5,2,[9 10]);
    plot(tv, RFL);
    title('curve radiuses');
    
    figure
    
    plot(tq, q);
    title('lateral acceleration');
end