trigger priventopportunities on Opportunity (before insert) {
	Set<Id> accountId = new Set<Id>();
    for(Opportunity opp : Trigger.new){
        accountId.add(opp.AccountId);
    }
    List<Account> acclist = [Select Id, Name, (select Id, Name, Active__c from Opportunities where Active__c = true) from Account Where Id IN: accountId];
     Map<id, boolean> bool = new map<id,boolean>();
    for(Account acc : acclist){
       bool.put(acc.id, acc.Opportunities.size()>0 ? true : false); 
    }
    for(Opportunity oppobj : Trigger.new){
        if(bool.get(oppobj.AccountId) == true){
           oppobj.adderror('Active Record already existed'); 
        }
    }
}