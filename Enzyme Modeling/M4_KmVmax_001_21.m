function [] = M4_KmVmax_001_21(v_initials, substrateConcentration, enzyme)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Calculate the Michaelis-Menten constants (Km) and maximum initial velocities
% (Vmax) for a set of enzyme reactions.
%
% Function Call
% M4_KmVmax_001_21(v_initials, substrateConcentration, enzyme)
%
% Input Arguments
% v_initial - initial velocities of the enzymatic reaction (uM/s)
% substrateConcentration - substrate concentrations of the enzymatic
% reaction (uM)
% enzyme - enzyme number (#)
%
% Output Arguments
% None
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

%array of linear substrate values and v0 is substrate over v0
substrateLinear = substrateConcentration;
v0Linear = substrateConcentration ./ v_initials;

% %creates array of reciprocal of substate and v0 values for Line Weaver Burk
% substrateLinear = 1 ./ substrateConcentration;
% v0Linear = 1 ./ v_initials;

%% ____________________
%% CALCULATIONS

% %Line Weaver Burk linearization for v_max and k_m
% coeffs = polyfit(substrateLinear, v0Linear, 1);
% v_max = 1 / coeffs(2);
% k_m = coeffs(1) * v_max;

% Improvement 2
% Used Hanes-Woolf instead of Lineweaver Burk to linearize the
% Michaelis-Menten enzyme kinetics data as it is less sensitive to errors 
% in the initial velocity measurements than the Lineweaver-Burk plot.

% Hanes-Woolf Linearization
coeffs = polyfit(substrateLinear, v0Linear, 1);
v_max = 1 / coeffs(1);
k_m = coeffs(2) / coeffs(1);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Prints the enzyme number, max velocity, and michaelis-menten constant
fprintf("Enzyme %d\n", enzyme)
fprintf("Max Velocity: %.3f\n", v_max);
fprintf("Michaelis–Menten constant: %.3f\n\n", k_m);

% Plots current data and model data.
figure(enzyme)
grid on
hold on
plot(substrateConcentration, v_initials, "b.")
plot(substrateConcentration, (v_max * substrateConcentration) ./ (k_m + substrateConcentration))
title("Michaelis-Menten Curve for Enzyme:", enzyme)
xlabel("Substrate Concentration (uM)")
ylabel("Initial Velocity (uM/s)")
legend("Measured Data", "Model Curve", "location", "northwest")

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The function I am submitting
% is my own original work.


