trigger NumberofContactsonAccount on Contact (after insert, after update, after delete, after undelete) {
	//List<Id> accountId = AccountProcessor.getIds(Trigger.new);    
    //AccountProcessor.countContacts(accountId);
    if(Trigger.isInsert && Trigger.isUndelete){
       NumberofContactsonAccount.countofContacts(Trigger.new); 
    }
    if(Trigger.isUpdate){
        NumberofContactsonAccount.countofContacts(Trigger.new);
    }
    if(Trigger.isUpdate ){
        NumberofContactsonAccount.countofContacts(Trigger.old);
    }
    if(Trigger.isDelete ){
        NumberofContactsonAccount.countofContacts(Trigger.old);
    }
    
}