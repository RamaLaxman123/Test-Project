global class EmailNotification implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        Date d = Date.Today()+1;
        String soql = 'SELECT Last_Password_Reset_Date__c, User_Name__c, Email__c, Environment_Type__c, Active__c '+
            			' FROM Salesforce_User__c WHERE Last_Password_Reset_Date__c =: d';
        return Database.getQueryLocator(soql);
    }
   
    global void execute(Database.BatchableContext bc, List<Salesforce_User__c> sfUsers) {
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        for(Salesforce_User__c user : sfUsers) {
            List<String> toAddresses = new List<String>();           
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            toAddresses.add(user.Email__c);
            mail.setToAddresses(toAddresses);
            mail.setSubject('Welcome to Batch Apex');
            String messageBody = '<html><body>Hi ' + user.User_Name__c + ',<br>Your account Expires today. <br>Kindly contact your administrator.<br><br><b>Regards,</b><br>Magulan D</body></html>';
            mail.setHtmlBody(messageBody); 
            mailList.add(mail);          
        } 
        Messaging.sendEmail(mailList);
    }
   
    global void finish(Database.BatchableContext bc) {
    }
}