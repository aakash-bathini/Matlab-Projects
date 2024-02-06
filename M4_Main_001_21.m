function [] = M4_Main_001_21()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program is used to call other User-Defined-Functions that calculate
% the initial velocities of each enzymes concentration, then use this
% information to calculate the maximum velocity of the enzyme and its
% MIchaelis Constant.
%
% Function Call
% M4_Main_001_21()
%
% Input Arguments
% Void
%
% Output Arguments
% Void
%
% Assignment Information
%   Assignment:     M04, Main Function
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
enzymeData = readmatrix("Data_nextGen_KEtesting_allresults.csv"); %read the enzyme data file
timeData = enzymeData(5:end, 1); %read the time data from enzyme data file in seconds
substrateConcentration = enzymeData(3, 2:11); %read substrate concentration from enzyme data file in uM
enzymeData = enzymeData(4:end, 2:end); % remove the NaN values of the data

%% ____________________
%% CALCULATIONS

for enzyme = 1:5
    concColumn = (enzyme - 1) * 20 + 1; %this column tests five times                                       
    tempData = enzymeData(:, concColumn:concColumn + 19); %only includes data of correct enzyme                    
    v_initials = M4_InitialVelocity_001_21(substrateConcentration, timeData, tempData); %calls v initials function for v0
    M4_KmVmax_001_21(v_initials, substrateConcentration, enzyme); %calls KmVmax function for km and vmax
end
       
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
    
    
 

%% ____________________
%% RESULTS
 

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.




