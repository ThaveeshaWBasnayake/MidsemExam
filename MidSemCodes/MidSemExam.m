%This project will include a series of code for askig the user for an input
%for a type of opertion, signal and the smount of shift. It will also aim
%to explain each section of code written in detail and make assumptions.
%These assumptions are that the shift can be either positive or negative
%and that exceptions should be thrown if an unrealistic valuce is entered.
%The final signal produced will consist of 4 different signals. 

%Ask user for the input information to begin the program
Signal = input('Please enter D for Discrete Signal or C for Continuous Signal = ',  's'); %Asks for the type of signal
Operation = input('What sort of operation should be carried. Enter either shifting (A), scaling (B) or reversing (R) = ', 's'); %Asks for the type of operation that should be conducted

%Only needs a user input if shifted or scaled
if Operation == 'A'
    Amount = input('Value for Shift = '); %Asking for value for the shifting process, also makes sure that is a integer value

elseif Operation == 'B'
    Amount = input('Value for Scale = '); %Asking for value for the scaling process, also makes sure that is a integer value
else

end

%Check if the inputed value is in a sufficent range (the allowable region
%will be between -100 and 100). If the input is invalid it terminates the
%program, and the program has to be run again. 
if Amount > 100
    fprintf('Error in input!')
    return

elseif Amount <-100
    fprintf('Error in input!') 
    return

else

end

%The four signals that will be used are cosine wave, square, horizontal
%line and sloped line

%Define the original functions
x1 = 0:.5:4; %limits the first piecewise function 2cos(pi/4)t
x2 = -4:.5:-2; %limits of the second piece function -t
t = -2:0.5:0;
x3 = unitStep(t,-2); %limits of the second piece function -t
x4 = -6:-4; %limits the third function 2
y1=(cos((pi/4)*x1)); %Creates a cosine wave
y2 = -x2-1; %Creates a negative slope 
y3 =[3 3 3]; %horizontal line where y=4

%If statment needs to be implemented for the type of signal chosen
if Signal == 'D'

    %Start plotting the original discrete time signal
    figure(2); subplot(2,1,1); %creates figure and subplot with 2 rows and 2 columns
    %plot all the signals with respect to one another
    stem(x1,y1,'filled');
    hold on;
    stem(x2,y2,'filled');
    hold on;
    stem(t,x3);
    hold on;
    stem(x4,y3,'filled');
    %label the x, y and give title
    xlabel('n');
    ylabel('x(n)');
    title('Orignal Discrete-Time Signal');
    grid on;
    hold on;

    %Sets the values for the axis layout starting from y to x respectively
    axis1=[0 0]; %values for the y-axis
    axis2=[-1 2.5]; %values for y-axis
    axis3=[-5 5]; %values for x-axis
    axis4 =[0 0]; %values for x-axis
    plot(axis1,axis2,axis3,axis4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;

    %create an enclosed if statement to determine the type of operation
    %that needs to operated on the original graph

    %Shifting Operation
    if Operation == 'A' %First define the shifting operation on the original graph using the user input
        Shift=Amount; 
        %sets values for the y and x axis respectively
        tts1=[0 0]; %values for the y-axis
        tts2=[-1 2.5]; %values for y-axis
        tts3=[(-5-(Shift)) (5-(Shift))]; %values for x-axis
        tts4 =[0 0]; %values for x-axis

if Shift<0 %if statement condition for when t is less than 0
    subplot(2,1,2);

    %create the plots with the given shifts
    stem(x1-(Shift),y1,'filled');
    hold on;
    stem(x2-(Shift),y2,'filled');
    hold on;
    stem(t-(Shift),x3);
    hold on;
    stem(x4-(Shift),y3,'filled');

    %format the graph
    grid on;
    xlabel('n'); %Defines the x-axis
    ylabel('x(n)'); %Defines the y-axis
    title('Time-Shifted Discrete Time Signal'); %Gives the graph a title

    hold on;
    plot(axis1,axis2,axis3,axis4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
else
    subplot(2,1,2); %Is using the first column, second row to plot

    %create the plots with the given shifts
    stem((x1-Shift),y1,'filled');
    hold on;
    stem((x2-Shift),y2,'filled');
    hold on;
    stem((t-Shift),x3);
    hold on;
    stem((x4-Shift),y3,'filled');

    %format the graph
    grid on;
    xlabel('n'); %Gives x-axis
    ylabel('x(n)'); %gives y-axis
    title('Time-Shifted Discrete Time Signal'); %gives the title to the graph

    hold on;
    plot(axis1,axis2,axis3,axis4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
end
    end

if Operation =='B' 

        %Scaling the Discrete Time Signal
n=1; d=4; %set the integers
t2=n/d; %equates t2 with the input number
%set the values for the y and x axis respectively
tc1 = [0 0];
tc2 = [-1 2.5];
tc3 = [-5 5];
tc4 = [0 0];

if t2==n/d
    subplot(2,1,2);
    %plots the graph that has been time shifted
    stem((x1*(Amount)),y1,'filled');
    hold on;
    stem((x2*(Amount)),y2,'filled');
    hold on;
    stem(((t*(Amount))),x3);
    hold on;
    stem(((x4*(Amount))),y3,'filled');

    grid on;
    grid minor; %turns on the minor grid as well for better understanding

    %Label the x and y axis as well as give a title
    xlabel('n'); 
    ylabel('x(n)');
    title('Scaled Discrete Time Signal');

    hold on;
    plot(axis1,axis2,(axis3*(d/n)),axis4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
end
end

if Operation == 'R'
    %Reversing of the Disctrete Time Signal
t3=-1;
n=Amount; d=Amount; %set the integers
t2=n/d; %equates t2 with the input number

if t3<0 && t2==n/d
    subplot(2,1,2);

    %plots the graph that has been time shifted
    stem(-(x1),y1,'filled');
    hold on;
    stem(-(x2),y2,'filled');
    hold on;
    stem(-(t),x3);
    hold on;
    stem(-(x4),y3,'filled');

    %turn on grid and label
    %format the graph by turning grid on and labeling the graph
    grid on;
    grid minor; %gives minor grid for better understanding
    xlabel('n'); %x label of graph
    ylabel('x(n)'); %y label of graph
    title('Reversed Discrete Time Signal'); %title of graph

    %plot the changes in the data
    hold on;
    plot(-(axis1),axis2,-(axis3*(d/n)),axis4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
end
end
end

%The coding for the continuous time signal is as follows
if Signal == 'C'
    %First the orignal graphs need to be drawn
    figure(1); subplot(2,1,1); %creates a subplot with 2 rows and 1 columns
plot(x1,y1,x2,y2,t,x3,x4,y3,'LineWidth',3) %plots the signal

xlabel('time'); %name X-axis
ylabel('f(t)'); %name y-axis
title('Original Continuous-Time Signal'); %set title

grid on; %turn grid lines
hold on; %holds the current graph for additional data

axis1=[0 0]; %values for the y-axis
axis2=[-1 2.5]; %values for y-axis
axis3=[-5 5]; %values for x-axis
axis4 =[0 0]; %values for x-axis
plot(axis1,axis2,axis3,axis4,'LineWidth',1); %plots the cross in cartesian plane
hold off; %takes the hold off

%First create the shifted continuous time signal using an if statement
if Operation == 'A'

ts1=[0 0]; %values for the y-axis
ts2=[-1 2.5]; %values for the y-axis
ts3=[(-5-(Amount)) (5-(-Amount))]; %values for the x-axis
ts4=[0 0]; %values for the x-axis

if Amount<0 %if statement condition if 't' is less than zero (negative)
    subplot(2,1,2); %creates a subplot with 2 rows and 1 columns

    plot((x1-(Amount)),y1,(x2-(Amount)), y2,(t-(Amount)), x3, (x4-(Amount)),y3,'LineWidth',4); %plots the graph

    grid on; %turns the grid on
    xlabel('time'); %x-label
    ylabel('f(t)'); %y-label
    title('Time-Shifted Continuous Time Signal'); %gives title

    hold on;
    plot(ts1,ts2,ts3,ts4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
else
    subplot(2,1,2); %creates a subplot with 2 rows and 1 columns, plotting this graph in the bottom section

    plot((x1-Amount),y1,(x2-Amount), y2,(t-(Amount)), x3, (x4-Amount),y3,'LineWidth',4); %plots the data which has been time-shifted according to the desired value (which would be a positive value)
    grid on; %turns grid on
    xlabel('time'); %names x-axis
    ylabel('f(t)'); %names y-axis
    title('Time-Shifted Continuous Time Signal'); %sets title

    hold on;
    plot(ts1,ts2,ts3,ts4,'LineWidth',1); %plots the cross in cartesian plane
    hold off;
end
end

%Create the scaling continous signal
if Operation == 'B'
    n=1; d=4; %set the integers
t2=n/d; %equates t2 with the input number

%set the values for the y and x axis respectively
tc1 = [0 0];
tc2 = [-1 2.5];
tc3 = [-5 5];
tc4 = [0 0];

 if t2==n/d %if condition statement
    subplot(2,1,2) %row 2 column 1
     plot((x1*(Amount)),y1,(x2*(Amount)),y2,(t*(Amount)),x3,(x4*(Amount)),y3,'LineWidth',4); %plots the signal

     grid on; %turn grid on
     grid minor; %turns on the smaller grid
 
    %label the axis and give the title
    xlabel('time'); %x-label
    ylabel('f(t)'); %y-label
     title('Scaled Continuous Time Signal');
 
     hold on;
     plot(tc1,tc2,(tc3*(d/n)),tc4,'LineWidth',1) %plots the data to be added
     hold off;
end
end

%Finally reversing of the continuous signal
if Operation == 'R'

    subplot(2,1,2); %plots of the graph in the second row first column
    plot(-(x1),y1,-(x2),y2,-(t),x3,-(x4),y3,'LineWidth',4); %plots the signal
    
    grid on; %turns on grid
    grid minor; %minor grid for better understanding
    xlabel('time'); %x-label
    ylabel('f(t)'); %y-label
    title('Reversed Continuous Time Signal'); %title of graph

    hold on;
    plot(axis1,axis2,axis3,axis4,'LineWidth',1);
    hold off;
end
end