trigger AccountNameDuplicatePreventer on Account (before insert, before update) {
    Set<String> accountName = new Set<String>();
    for(Account acc : Trigger.new){
       accountName.add(acc.Name); 
    }
    List<Account> acclist = [Select Id, Name from Account where Name IN : accountName];
    for(Account a : Trigger.new){
        for(Account ac : acclist){
            if(ac.Name == a.Name){
                ac.addError('This Account Name already existed'); 
            }           
        }
    }
}