public class MyQueueableClass implements Queueable {
    private List<Contact> contacts;
    public MyQueueableClass(List<Contact> mycontacts){
        contacts = mycontacts;
    }
    public void execute(QueueableContext context){
        for(Contact con : contacts){
            /*String response = anotherClass.calloutMethod(con.Id,
														con.FirstName,
														con.LastName,
														con.Email);*/
        }
    }
    List<Contact> contacts1 = [SELECT Id, LastName, FirstName, Email
                              FROM Contact];
    Id jobId = System.enqueueJob(new MyQueueableClass(contacts1));
    
}