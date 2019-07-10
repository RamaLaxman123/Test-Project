trigger SendConfirmationEmail on Session_Speaker__c (after insert, after update) {
    List<Id> sessionspeakerId = new List<Id>();
    for(Session_Speaker__c ssobj : Trigger.new){
        sessionspeakerId.add(ssobj.Id);
    }
    List<Session_Speaker__c> sslist = new List<Session_Speaker__c>();
    sslist = [Select Session__r.Name,Session__r.Session_Date__c,Speaker__r.First_Name__c,Speaker__r.Last_Name__c,Speaker__r.Email__c
              From Session_Speaker__c Where Id IN: sessionspeakerId AND Speaker__r.Email__c <> null];
    system.debug('sslist***'+sslist);
    	
    	String[] addresses = new String[]{},
        		 subjects = new String[]{},
            	 messages = new String[]{};
                
                for(Session_Speaker__c sessionspeaker : sslist){
                    addresses.add(sessionspeaker.Speaker__r.Email__c);
                    subjects.add('Speaker Confirmation');
                    messages.add('Dear ' + sessionSpeaker.Speaker__r.First_Name__c +
                                 ',\nYour session "' + sessionSpeaker.Session__r.Name + '" on ' +
                                 sessionSpeaker.Session__r.Session_Date__c + ' is confirmed.\n\n' +
                                 'Thanks for speaking at the conference!');
                }
    	EmailManager.sendMail(addresses,subjects,messages);
}