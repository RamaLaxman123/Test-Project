trigger AccountTrigger on Account (before insert, before update, before delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        //AccountHandler.CreateNewOpportunity(Trigger.new);
        AccountTriggerHandler.CreateAccounts(Trigger.new);
    }
}