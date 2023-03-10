import ballerina/io;
import ballerinax/covid19;
import ballerinax/worldbank;

@display {label: "Country Code"}
configurable string country = ?;

@display {label: "Recipient's Email"}
configurable string emailAddress = ?;

public function main() returns error? {

    covid19:Client covid19Client = check new ();
    covid19:CovidCountry statusByCountry = check covid19Client->getStatusByCountry(country);
    decimal totalCases = statusByCountry.cases;

    worldbank:Client worldBankClient = check new ();
    worldbank:IndicatorInformation[] populationByCountry = check worldBankClient->getPopulationByCountry(country);
    int population = (populationByCountry[0].value ?: 0) / 1000000;

    decimal totalCasesPerMillion = totalCases / <decimal>population;
    
    string greeting = "Population " + totalCasesPerMillion.toString();
    io:println(greeting);
    
}
