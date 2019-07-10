@isTest
public class SendEmailBatchTest {
    public static testMethod void testBatchclass(){
        String CRON_EXP = '0 0 0 15 3 ? *';
        User us = [Select Id from User where Id = :UserInfo.getUserId()];
        List<City__c>  citiesList = new List<City__c>();
        City__c city1 = new City__c();
        city1.Name = 'test1';
        city1.User__c = us.Id;
        citiesList.add(city1);
        City__c city2 = new City__c();
        city2.Name = 'test2';
        city2.User__c = us.Id;
        citiesList.add(city2);
        insert citiesList;
      System.runAs(us){
   		Test.startTest();
     		SendEmailBatch obj = new SendEmailBatch();
     		DataBase.executeBatch(obj);
			String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new SendEmailBatch());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);          
   		Test.stopTest();
   }
    }
}