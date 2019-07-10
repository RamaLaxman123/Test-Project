public class ContactAndLeadSearch {
    public Static List<List<SObject>> searchContactsAndLeads(String lastname){
        List<List<SObject>> leadandcontactlist = [FIND :lastname IN ALL FIELDS 
                   								RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
        List<Lead> leadlist = leadandcontactlist[0];
        List<Contact> conlist = leadandcontactlist[1];
        return leadandcontactlist;
    }
}