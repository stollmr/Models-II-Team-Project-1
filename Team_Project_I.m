%Models II Team Project I
%Group:

clear;
clc;
load Electricity_Data.mat;

analizeChoice = menu('How would you like to analze the electricity data?','By Year', 'By Country', 'By Production Type');

switch analizeChoice
    case 1
        yearChoice = menu('Please select a year:',' )
    case 2
        countryChoice = menu('Please select a country:', 'America', 'Australia', 'Brazil', 'Canada', 'China', 'Cuba', 'Germany', 'India', 'Japan', 'Madagascar', 'Russia', 'Input Other');
            if countryChoice == 12
                countryChoice = input('Please input a country: ', 's');
                while isempty(countryChoice) %Error catching
                    countryChoice = input('Please input a country: ', 's');
                end
            elseif countryChoice == 1
                countryChoice = 'United States';
            elseif countryChoice == 2
                countryChoice = 'Australia';
            elseif countryChoice == 3
                countryChoice = 'Brazil';
            elseif countryChoice == 4
                countryChoice = 'Canada';
            elseif countryChoice == 5
                countryChoice = 'China';
            elseif countryChoice == 6
                countryChoice = 'Cuba';
            elseif countryChoice == 7
                countryChoice = 'Germany';
            elseif countryChoice == 8
                countryChoice = 'India';
            elseif countryChoice == 9
                countryChoice = 'Japan';
            elseif countryChoice == 10
                countryChoice = 'Madagascar';
            elseif countryChoice == 11
                countryChoice = 'USSR';
            end
        %Analyze data here
        end
    case 3
        productionChoice = menu('Please select a production type:', 'Hyrdo','Solar','Wind','Nuclear','Total Production' )
end
