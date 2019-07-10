public class AccountProcessor {
    
  @future
  public static void countContacts(List<Id> idsList) {
      List<Id> listIds = getAccountsId(idsList);
      List<Account> lstAccount = [select id, Count_Of_Contacts__c , (select id from contacts ) from account where id in :listIds ];
      for( Account acc : lstAccount ){
          List<Contact> lstCont = acc.contacts ;
          acc.Count_Of_Contacts__c = lstCont.size();
      }
      update lstAccount;
  }
    public static List<Id> getIds(List<sObject> sobjectlist){
        List<Id> idslist = new List<Id>();        
        for(sObject obj : sobjectlist){
            idslist.add(obj.Id);
        }
        return idslist;
    }
    public static List<Id> getAccountsId(List<Id> Ids){
        List<Contact> ctList = [select id, name, accountId from Contact where Id IN: Ids];
        List<Id> idsList = new List<Id>();        
        for(Contact obj : ctList){
            idsList.add(obj.accountId);
        }
        return idsList;
    }    
}