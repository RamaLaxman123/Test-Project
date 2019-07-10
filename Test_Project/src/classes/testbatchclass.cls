global class testbatchclass implements Database.Batchable<sObject>{
	global Database.QueryLocator Start(Database.BatchableContext bc){
		String query = 'Select Id, Name, Count_Of_Contacts__c, (Select Id, Name from Contacts) from Account';
		system.debug('=====>'+Database.getQueryLocator('query'));
        return Database.getQueryLocator('query');
	}
	global void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('scope====>'+scope);
		List<Account> updateAccountList = new List<Account>();
		for(Account acc : scope){
			acc.Count_Of_Contacts__c = acc.Contacts.size();
            system.debug('acc.Contacts.size()====>'+acc.Contacts.size());
			updateAccountList.add(acc);
            system.debug('updateAccountList====>'+updateAccountList);
		}
		update updateAccountList;
	}
	global void finish(Database.BatchableContext bc){
	
	}
}