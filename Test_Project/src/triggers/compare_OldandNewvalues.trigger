trigger compare_OldandNewvalues on Account (after update) {
   Map<Id, Account> AccountMap = new Map<Id, Account>();
    for (Account a : Trigger.new) {
        if (a.Phone != Trigger.oldMap.get(a.Id).Phone) {
            AccountMap.put(a.Id, a);
        }
    }
    if (AccountMap.size() > 0) {
        List<Contact> updateconlist = new List<Contact>();
        for (Contact con : [SELECT Id, AccountId, Phone, Name FROM Contact                
                                    WHERE AccountId IN :AccountMap.keySet()]) {
            Account acc = AccountMap.get(con.AccountId);
                con.Phone = acc.Phone;
                updateconlist.add(con);
        }
        update updateconlist;
        
         List<Opportunity> updateOpplist = new List<Opportunity>();
        for (Opportunity opp : [SELECT Id, AccountId, Phone__c, Name FROM Opportunity                
                                    WHERE AccountId IN :AccountMap.keySet()]) {
            Account acc = AccountMap.get(opp.AccountId);
                opp.Phone__c = acc.Phone;
                updateOpplist.add(opp);
        }
        update updateOpplist;
    }
       
}