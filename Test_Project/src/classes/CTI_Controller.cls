public class CTI_Controller {
    public Account accountObj{get;set;}
    public List<Account> accountList{get;set;}
    //Public User usr{get;set;}
    public String accName{get;set;}
    public String accPhone{get;set;}
    public String accId{get;set;}
	public String userFirstName{get;set;}
	public String userLastName{get;set;}
	public String userName{get;set;}
	public String userId{get;set;}
	
   public CTI_Controller() {
		Account accountObj = new Account();
        accountList = new List<Account>();
       //usr = new User();
       system.debug('accountList***'+accountList);
		accountList = [SELECT Id, Name, Owner.Id, Owner.Name, Owner.firstname, Owner.lastname, Phone FROM Account 
                      WHERE Id =:apexpages.currentpage().getparameters().get('Id')];
       	// usr = [SELECT Id, Name, LastName, FirstName FROM User WHERE ID = :UserInfo.getUserId()]; 
           if(accountList.size()>0){
               //system.debug('accountList***'+accountList);
            for(Account acc : accountList){
                system.debug('account***'+acc);
                User usr = new User();
                system.debug('User***'+usr);
                  accPhone		  = acc.Phone;
           		  accName		  = acc.Name;
           		  accId          = acc.Id;
           		  userFirstName  = usr.FirstName;
           		  userLastName   = usr.LastName;
           		  userName		  = usr.Name;
           		  userId         = usr.Id; 
               }
           
           }
       }  
           
    }