public class ContactSearch {
    public Static List<Contact> searchForContacts(String lastname, String mailingpostalcode){
        List<Contact> conlist = new List<Contact>();
        conlist = [Select Id, Name, MailingPostalCode from Contact where LastName =: lastname AND MailingPostalCode =: mailingpostalcode];
        return conlist;
    }
}