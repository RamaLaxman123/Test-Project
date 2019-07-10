public class CaseController {
    public Case caseobj{get;set;}
    public List<Case> caselist{get;set;}
    
    public CaseController(){
        caseobj = new Case();
        caselist = new List<Case>();
    }
    public void saveCase(){
        insert caseobj;
    }
    public void sendEmail(){
        insert caseobj;
        caselist = [Select Id, Subject, Description, ContactId, Contact.Phone, Contact.Email from Case where Id =: caseobj.Id];
        if(caselist.size()>0){
            EmailTemplate templat = [Select Id from EmailTemplate where name = 'Test Template' limit 1];
			List<Messaging.MassEmailMessage> listMails = new List<Messaging.MassEmailMessage>(); 	
           List<string> toAddress = new List<string>();
				toAddress.add('ramalakshumaiah@gmail.com');
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    		mail.setTemplateId(templat.Id);
    		mail.setToAddresses(toAddress);
    		mail.setSubject('test subject');
    		//mail.setTargetObjectId(primaryContact);
    		//mail.setWhatId(primaryAccount);
    		mail.setSaveAsActivity(false);
    mail.setUseSignature(false);
List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
allmsg.add(mail);

try {
    Messaging.sendEmail(allmsg,false);
    return;
} catch (Exception e) {
    System.debug(e.getMessage());
}
        }
    }
}