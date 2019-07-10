public class MyFutureClass {
	@future(callout=true)
    public Static void myFutureMethod(Set<Id> ids){
       List<Contact> conlist = [SELECT Id, LastName, FirstName, Email FROM Contact WHERE Id IN: ids];
        for(Contact con : conlist){
            /*String response = anotherClass.calloutMethod(con.Id,
                    con.FirstName,
                    con.LastName,
                    con.Email);*/
    }
  }
}