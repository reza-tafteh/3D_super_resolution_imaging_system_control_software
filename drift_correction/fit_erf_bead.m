function [cFit, fitImage] = fit_erf_bead(A, coeff, xMesh, yMesh, mesh)
% fit_erf_bead fits an erf to A(:) using nlinfit, starting with coeff as initial values. 
% INPUTS: 
% A: bead/blink cut 
% coeff: a row containing starting points for fitting. 

% OUTPUTS:
% cFit: 
    % - cFit(1:6): fitting values => bg, amp, xc, wx, yc, wy 
    % - cFit(7:12): upper/lower bounds => same order as fitting valuses
    % - cFit(13): goodness of fit

% global mesh xMesh yMesh 
warning off;
% fitFunc = @(fitCoeff, xMesh, yMesh) ... 
%     fitCoeff(1)+fitCoeff(2)* ...
%     ( ( erf((xMesh-fitCoeff(3)+0.5)/(sqrt(2)*fitCoeff(4))) - erf((xMesh-fitCoeff(3)-0.5)/(sqrt(2)*fitCoeff(4))) ) ...
%     .*( erf((yMesh-fitCoeff(5)+0.5)/(sqrt(2)*fitCoeff(6))) - erf((yMesh-fitCoeff(5)-0.5)/(sqrt(2)*fitCoeff(6))) ));

I = A(:);
fitFunc = @(c, surface) ...
    c(1)+c(2)*((erf((surface(:,1)-c(3)+0.5)/c(4))- ...
    erf((surface(:,1)-c(3)-0.5)/c(4))) ...
    .*(erf((surface(:,2)-c(5)+0.5)/c(6))-erf((surface(:,2)-c(5)-0.5)/c(6))));

fitFunc2 = @(fitCoeff, xMesh, yMesh) ... 
    fitCoeff(1)+fitCoeff(2)* ...
    ( ( erf((xMesh-fitCoeff(3)+0.5)/(sqrt(2)*fitCoeff(4))) - erf((xMesh-fitCoeff(3)-0.5)/(sqrt(2)*fitCoeff(4))) ) ...
    .*( erf((yMesh-fitCoeff(5)+0.5)/(sqrt(2)*fitCoeff(6))) - erf((yMesh-fitCoeff(5)-0.5)/(sqrt(2)*fitCoeff(6))) ));

opts = optimset('TolFun',1e-3,'TolX',1e-4,'MaxIter', 100);
[fitCoeff, Res,J,CovB,~,~] = ...
    nlinfit( mesh, I, fitFunc, coeff, opts);
cFit(1:6) = fitCoeff';
cFit(4) = cFit(4)/sqrt(2);
cFit(6) = cFit(6)/sqrt(2);
% upper and lower bounds
conf2 = nlparci(fitCoeff,Res,'covar',CovB,'alpha',0.3173); % 68% confidence
ci = conf2';
cFit(7:12) = (ci(2,:)-ci(1,:))/2;
cFit(10) = cFit(10)/sqrt(2);
cFit(12) = cFit(12)/sqrt(2);
totalRes = sum((I-mean(I)).^2);
cFit(13) = 1 - sum(Res.^2)/totalRes; % goodness of fit

% display('here');
fitImage = fitFunc2(cFit(1:6),xMesh, yMesh);

%pause(0.05);
end
