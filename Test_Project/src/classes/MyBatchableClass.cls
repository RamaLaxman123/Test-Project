global class MyBatchableClass implements Database.Batchable<sObject>, Database.Stateful {
	global Integer numOfRecs = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name FROM Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> acclist){
        for(Account acc : acclist){
           numOfRecs = numOfRecs + 1;
            system.debug('numOfRecs***:'+numOfRecs);
        }
    }
    global void finish(Database.BatchableContext bc){
       /*EmailManager.sendMail('laxman.r2011@gmail.com',
                              numOfRecs + ' Accounts were processed!',
                              'Meet me at the bar for drinks to celebrate');*/             
    }
}