public with sharing class TestAccount {
 public static void insertRecord(List<Account> acclist){
 	Set<Id> accId = new Set<Id>();
 	List<Account> updateacclist = new List<Account>();
 	for(Account acc : acclist){
 		accId.add(acc.Id);
 	}
 	updateacclist = [Select Name from Account where Id IN: accId];
 	for(Account accobj : updateacclist){
 		accobj.Name = 'Laxman Sfdc';
 	}
 	update updateacclist;
 }   
}