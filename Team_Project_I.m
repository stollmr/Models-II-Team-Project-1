%Models II Team Project I
%Group:

clear;
clc;
load Electricity_Data.mat;

warning('off','all'); %Disables unneeded warning messages that may appear.

analyzeChoice = menu('How would you like to analze the electricity data?','By Year', 'By Country', 'By Production Type');

switch analyzeChoice
    case 1
        yearChoice = menu('Please select a year:',' )
    case 2
        countryChoice = menu('Please select a country:', 'America', 'Australia', 'Brazil', 'Canada', 'China', 'Cuba', 'Germany', 'India', 'Japan', 'Madagascar', 'Russia', 'Input Other');
            if countryChoice == 11
                fprintf('Warning: Entries are case sensitive.\n\n');
                countryChoice = input('Please input a country: ', 's');
                while isempty(countryChoice) %Error catching
                    clc;
                    fprintf('Warning: Entries are case sensitive.\n\n');
                    countryChoice = input('Please input a country: ', 's');
                end
                while strcmp(countryChoice, Electricity_Data.Country) == 0 %Error catching
                    clc;
                    fprintf('Warning: Entries are case sensitive.\n\n');
                    fprintf('Entry of "%s" is not a valid country.\n\nPlease input a valid country:', countryChoice);
                    countryChoice = input(' ', 's');
                    end
                clc;
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
                    %Total energy production / demand
        for k = 1990:2011
            production(k-1989) = Electricity_Data.Total_Production(find(Electricity_Data.Year == k & strcmp(Electricity_Data.Country, countryChoice) == 1));
            demand(k-1989) = Electricity_Data.Demand(find(Electricity_Data.Year == k & strcmp(Electricity_Data.Country, countryChoice) == 1));
            year(k-1989) = k;
        end
        
        figure;
        subplot(2,2,1);
        plot(year, production, '-b*', year, demand, '-ro');
        title('Total Energy Production and Demand by Year');
        xlabel('Year');ylabel('Energy (Million kWh)');
        legend('Energy Production', 'Energy Demand','Location','northwest');
        %Line graph of production types per year
        for l = 1990:2011
            productionHydro(l-1989) = Electricity_Data.Hydro_Production(find(Electricity_Data.Year == l & strcmp(Electricity_Data.Country, countryChoice) == 1));
            if productionHydro(l-1989) == -9999
                productionHydro(l-1989) = 0;
            end
            productionSolar(l-1989) = Electricity_Data.Solar_Production(find(Electricity_Data.Year == l & strcmp(Electricity_Data.Country, countryChoice) == 1));
            if productionSolar(l-1989) == -9999
                productionSolar(l-1989) = 0;
            end
            productionWind(l-1989) = Electricity_Data.Wind_Production(find(Electricity_Data.Year == l & strcmp(Electricity_Data.Country, countryChoice) == 1));
            if productionWind(l-1989) == -9999
                productionWind(l-1989) = 0;
            end
            productionNuclear(l-1989) = Electricity_Data.Nuclear_Production(find(Electricity_Data.Year == l & strcmp(Electricity_Data.Country, countryChoice) == 1));
            if productionNuclear(l-1989) == -9999
                productionNuclear(l-1989) = 0;
            end
        end
        
        subplot(2,2,2);
        plot(year,productionHydro,'-b+', year,productionSolar,'-ro', year,productionWind,'-g.', year, productionNuclear,'-m^');
        title('Energy Production Per Year by Type');
        xlabel('Year');ylabel('Energy (Million kWh)');
        legend('Hydro','Solar','Wind','Nuclear');
        %Pie chart of production types
        avgHydro = mean(productionHydro);
        avgSolar = mean(productionSolar);
        avgWind = mean(productionWind);
        avgNuclear = mean(productionNuclear);
        
        subplot(2,2,3)
        avgProduction = [avgHydro avgSolar avgWind avgNuclear];
        pie(avgProduction);
        title('Average Energy Production Distribution');
        legend('Hydro','Solar','Wind','Nuclear');
        %Energy surplus and deficit
        for p = 1:22
            surplus(p) = production(p) - demand(p);
        end
        
        subplot(2,2,4);
        bar(year, surplus);
        title('Energy Surplus Per Year');
        xlabel('Year');ylabel('Energy (Million kWh)');
        end
        
        fprintf('Please maximize the display window.\n')
    case 3
        productionChoice = menu('Please select a production type:', 'Hyrdo','Solar','Wind','Nuclear','Total Production' )
end

warning('on','all'); %Reenables warnings just in case.
