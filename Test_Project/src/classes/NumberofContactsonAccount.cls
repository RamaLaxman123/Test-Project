public class NumberofContactsonAccount {
    public Static void countofContacts(List<Contact> conlist){
        if(conlist.size() > 0 && conlist != null){
            try{
                List<Account> contactupdatelist = new List<Account>();
                List<Account> updatelist = new List<Account>();
                Set<Id> accId = new Set<Id>();
                for(Contact con : conlist){
                   accId.add(con.AccountId); 
                }
                contactupdatelist = [Select Id, Count_Of_Contacts__c,(Select Id from Contacts) from Account where Id IN: accId];
                for(Account acc : contactupdatelist){
                    acc.Count_Of_Contacts__c = acc.Contacts.size();
                    updatelist.add(acc);
                }
                update updatelist;
            }catch(Exception e){
                system.debug('error message'+e.getMessage());
            }
        }
    }
}