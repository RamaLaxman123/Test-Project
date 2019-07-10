public with sharing class CityWeatherController {

	public String city {get;set;}
	public String temp {get;set;}
	public String pressure {get;set;}
	public String humidity {get;set;}
	public String temp_min {get;set;}
	public String temp_max {get;set;}

	public CityWeatherController(ApexPages.StandardController stdController) {
		City__c cityObj = (City__c)stdController.getRecord();
		cityObj = [SELECT Id, Name FROM City__c WHERE Id =:cityObj.Id];
		
		String cityName = cityObj.Name;
		String apiKey = 'c7a67015e8f20b68abd55ae6a63d2471';

		String requestEndpoint = 'http://api.openweathermap.org/data/2.5/weather';
		requestEndpoint += '?q=' + cityName;
		requestEndpoint += '&units=metric';
		requestEndpoint += '&APPID=' + apiKey;
		
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(requestEndpoint);
		request.setMethod('GET');
		HttpResponse response = http.send(request);

		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {

		   // Deserialize the JSON string into collections of primitive data types.
		   Map<string,Object> results = (Map<string,Object>) JSON.deserializeUntyped(response.getBody());
		   city = String.valueOf(results.get('name'));
		   
		   Map<string,Object> mainResults = (Map<string,Object>)(results.get('main'));
		   temp = String.valueOf(mainResults.get('temp'));
		   pressure = String.valueOf(mainResults.get('pressure'));
			humidity = String.valueOf(mainResults.get('humidity')); 
			temp_min = String.valueOf(mainResults.get('temp_min')); 
			temp_max = String.valueOf(mainResults.get('temp_max'));
            
            cityObj.Name = city;
            cityObj.Pressure__c = pressure;
            cityObj.Temparature__c = temp;
            cityObj.Temp_Min__c = temp_min;
            cityObj.Temp_Max__c = temp_max;
            cityObj.Humidity__c = humidity;
            //update cityObj;
		
		} else {
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error retrieving the weather information.');
           ApexPages.addMessage(myMsg);
		}
	

	}
}