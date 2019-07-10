global class SendEmailBatch implements Database.Batchable<sobject>, Schedulable {
     public EmailTemplate et{get;set;}
     String Query;
    
	global Database.QueryLocator start(Database.BatchableContext bc) {
       Query = 'SELECT Id, Name, Email__c From City__c WHERE User__r.Subscriber__c = True';
       return Database.getquerylocator(Query);
    }

	global void execute(Database.BatchableContext bc, List<City__c> citiesList) {
        system.debug('citiesList====>'+citiesList);
       List < Messaging.SingleEmailMessage > emails = new List < Messaging.SingleEmailMessage > ();
       List<String> toAddresses = new List<String>();
       et=[select Id, Name FROM EmailTemplate where Name='WeatherReport' Limit 1];
        system.debug('et>>>'+et);
     for (City__c cityobj: citiesList) { 
       toAddresses.add(cityobj.Email__c);
       system.debug('toAddresses>>>'+toAddresses);
       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
       email.setToAddresses(toAddresses);
       //system.debug('email.setTemplateId()>>>'+setTemplateId());
       email.setTemplateId(et.Id);
       email.setSubject('Weather Report based on City'); 
       //email.setPlainTextBody('Dear User, Your City '+cityobj.Name+' Weather Report');
       emails.add(email);
    }
       Messaging.sendEmail(emails);
  }

	global void finish(database.BatchableContext bc) {
        
    }
     global void execute(schedulableContext sc){
        SendEmailBatch batch = new SendEmailBatch();
        ID batchprocessId = Database.executeBatch(batch,200);
    }
}