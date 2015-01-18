%Models II Team Project I
%Group:

clear;
clc;
load Electricity_Data.mat;

analizeChoice = menu('How would you like to analze the electricity data?','By Year', 'By Country', 'By Production Type');

switch analizeChoice
    case 1
         yearChoice = input('Please input a year between 1990 and 2011 that you would like to analyze:');
        chartChoice=menu('Please select how you would like to view this information.','Pie Chart of Power Used','Graphs of Contribuiters','Energy Production Chart');
        switch chartChoice;
            case 1
                X=find(Electricity_Data.Hydro_Production >-9999 & Electricity_Data.Year==yearChoice);
                HydroSum=sum(Electricity_Data.Hydro_Production(X));
                
                Y=find(Electricity_Data.Nuclear_Production >-9999 & Electricity_Data.Year==yearChoice);
                NuclearSum=sum(Electricity_Data.Nuclear_Production(Y));
                
                Z=find(Electricity_Data.Solar_Production >-9999 & Electricity_Data.Year==yearChoice);
                SolarSum=sum(Electricity_Data.Solar_Production(Z));
                
                W=find(Electricity_Data.Wind_Production >-9999 & Electricity_Data.Year==yearChoice);
                WindSum=sum(Electricity_Data.Wind_Production(W));
                
                PieInfo= [HydroSum NuclearSum SolarSum WindSum];
                
                labels= {'Hydro','Nuclear','Solar','Wind'};
                
                pie(PieInfo,explode,labels);
                    
                case 2
                case 3
                case 4
            end
        elseif  yearChoice>2011 & yearChoice<1990; 
            while yearChoice>2011 & yearChoice<1990;
                
                yearChoice =input('That value is a invalid year! Please input a year between 1990 and 2011 that you would like to analyze:');
            end
 

end
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
