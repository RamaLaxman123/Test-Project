trigger UpdateAccount on Contact (after insert, after update) {
    List<Account> updateaccountList = new List<Account>();
    Set<Id> accountId = new Set<Id>();
    for(Contact conobj : Trigger.new){
        if(conobj.LastName != null){
           accountId.add(conobj.AccountId);
           system.debug('accountId+++>'+accountId);
        }        
    }
    List<Account> accList =[Select Id, Phone from Account where Id IN: accountId];
    system.debug('accList+++>'+accList);
    for(Account accobj : accList){
        accobj.Phone = '9885488510';
        updateaccountList.add(accobj);
    }
    system.debug('updateaccountList+++>'+updateaccountList);
    update updateaccountList;
}