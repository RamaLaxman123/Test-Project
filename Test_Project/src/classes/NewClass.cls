public with sharing class NewClass {
   	public static void getAccount(List<Account> acclist){
   		set<Id> accountId = new set<Id>();
   		for(Account acc: acclist){
   			accountId.add(acc.Id);
   		}
   	} 
}