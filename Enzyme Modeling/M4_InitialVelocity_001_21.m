function [v_initials] = M4_InitialVelocity_001_21(substrateConcentration, timeData, tempData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program smoothens the enzyme curve by taking the slope between every
% three data points, and replotting the curve with the movmean function. 
% It then calculates the V0 value by averaging the first 20 slope values. 
%
% Function Call
% M4_InitialVelocity_001_21(substrateConcentration, timeData, tempData)
%
% Input Arguments
% substrateConcentration - substrate concentrations of the enzymatic reaction (uM)
% timeData - time of reaction (s)
% tempData - temporary enzyme data
%
% Output Arguments
% v_initials: the V0 values from data in (uM/s]
%
% Assignment Information
%   Assignment:     M4
%   Team member:    Soren Danger Colby,    colby6@purdue.edu
%                   Kabir Nagpal,          nagpal3@purdue.edu    
%                   Aakash Bathini,        abathin@purdue.edu
%   Team ID:        001-21
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Soren Danger Colby,    colby6@purdue.edu
%                           Kabir Nagpal,          nagpal3@purdue.edu
%                           Aakash Bathini,        abathin@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% Improvement 1
% Changed the percentage to 0.019 to reduce the size of the initial data
% subset used for calculating each v0 value. We experimented with different
% values and 0.019 had the lowest percent error.

percentage = 0.019; % percentage of data to use for v0 calculations          
v_initials = []; %initializing vector of the v0s                      

%% ____________________
%% CALCULATIONS

% for loop for every v0 calculation
for concColumn = 1:width(tempData)
    curConcentrations = rmmissing(tempData(:, concColumn));                               
    initialData = curConcentrations(1:floor(length(curConcentrations) * percentage ));  % data includes the percentage and is cut
    initialTime = timeData(1:length(initialData));  % time vector is cut so only the percentage data exists

    coeffs = polyfit(initialTime, initialData, 1); %find v0 with smoothened data
    v0 = coeffs(1);
    v_initials = [v_initials, v0];
end

%gets v0 values for regular and duplicate tests
for index = 1:length(substrateConcentration)
    v_initials(index) = (v_initials(index) + v_initials(index + length(substrateConcentration))) / 2;
end

v_initials = v_initials(1:length(substrateConcentration));

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The function I am submitting
% is my own original work.