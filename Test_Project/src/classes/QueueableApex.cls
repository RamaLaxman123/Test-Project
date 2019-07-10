public class QueueableApex implements Queueable {
    Contact con;
    String strState;
    public QueueableApex(Contact con, String strState) {
        this.con = con;
        this.strState = strState;
    }
    
    public void execute(QueueableContext qc) {
        List < Account > listAccount = [ SELECT Id FROM Account WHERE BillingState =: strState LIMIT 200 ];
        List < Contact > listContact = new List < Contact >();
        for ( Account acc : listAccount ) {
            Contact c = con.clone();
            system.debug('con.clone***'+con.clone());
            c.AccountId = acc.Id;
            system.debug('listContact***'+listContact);
            listContact.add(c);
        }
        insert listContact;
    }

}