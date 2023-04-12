%Here we create the Unit Step Function
function u=unitStep(t,switchTime)
%t represents the vector of time samples and switchTime is where the unit
%step switches values

%Obtain the samples in output signal
N=numel(t);

%initalise the function
u=zeros(N,1);

%find where the unit step function turns on
if median(diff(t))>0
    startInd=min(find(t>=switchTime));
    popInd = startInd:N;
elseif median(diff(t))<0
    %time reversed signal, when the unit step function turns off
    switchTime=-switchTime;
    startInd=max(find(t>=switchTime));
    popInd=1:startInd;
end

%make sure that the step function has an amplitude of 1
u(popInd)=1;

return