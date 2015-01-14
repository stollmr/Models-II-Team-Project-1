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
        else
            %
        end
    case 3
        productionChoice = menu('Please select a production type:', 'Hyrdo','Solar','Wind','Nuclear','Total Production' )
end
