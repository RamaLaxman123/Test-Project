trigger CheckDuplicateNameandCity on Account (before insert, before update) {
    Set<String> namestr = new Set<String>();
    Set<String> citystr = new Set<String>();
    for(Account acc : Trigger.new){
        namestr.add(acc.Name);
        citystr.add(acc.BillingCity);        
    }
    List<Account> accList = [select Name, BillingCity from Account where Name In: namestr and BillingCity In: citystr];
    
        for(Account acc : Trigger.new){
            for(Account a:accList){
            if((a.Name == acc.Name) || (a.BillingCity == acc.BillingCity)){
                acc.addError('the account is existed');
            }
        }
    }
}