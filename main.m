

clear
clc
close

% filename = "FMC1_Table.xlsx";
% filename = "FMC2_Table.xlsx";
filename = "FMC2_Table_No_HB";

[numbers, strings, raw] = xlsread(filename);


%% MATLAB generate .UCF constraints --> FMC1

% a = 5;
% fprintf("Testing %i \n\n\n", a);

% NET "Pin_P" LOC = A0;

for i = 1:1:size(strings,1)
    str = ['NET ' char(34) strings{i,1} char(34) ' LOC = ' strings{i,2} ';'];
    fprintf(str);
    fprintf('\n');
end

fprintf('\n\n\n');

% NET "CLKIQ_N[7]" IOSTANDARD = LVDS;
for i = 1:1:size(strings,1)
    str = ['NET ' char(34) strings{i,1} char(34) ' IOSTANDARD = LVDS;'];
    fprintf(str);
    fprintf('\n');
end

fprintf("\n\n\n ************************** \n\n\n");


%% OUTPUT top

for i = 1:1:size(strings,1)
    if i == size(strings,1)
        str = ['output ' strings{i,1}];
    else
        str = ['output ' strings{i,1} ','];
    end
    fprintf(str);
    fprintf('\n');
end


fprintf("\n\n\n ************************** \n\n\n");


%% Differential buffering

%{
OBUFDS OBUFDS_mod (
    .I(w_clock), 
    .O(_P), 	
    .OB(_N)
);
%}


for i = 1:2:size(strings,1)
    str = ['OBUFDS OBUFDS_' strings{i,1} ' (\n\t' ...
        '.I(w_clock), \n\t' ...
        '.O(' strings{i+1,1} '), \n\t' ...
        '.OB(' strings{i,1} ')\n);'];
    fprintf(str);
    fprintf('\n');
end





















