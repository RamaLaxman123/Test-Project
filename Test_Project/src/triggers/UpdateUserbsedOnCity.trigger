trigger UpdateUserbsedOnCity on City__c (after insert, after update) {
	List<User> updateuserList = new List<User>();
    Set<Id> userId = new Set<Id>();
    for(City__c cityobj : Trigger.new){
        if(cityobj.Name != null){
           userId.add(cityobj.User__c);
           system.debug('userId+++>'+userId);
        }        
    }
    List<User> userList =[Select Id, Subscriber__c from User where Id IN: userId];
    system.debug('userList+++>'+userList);
    for(User userobj : userList){
        userobj.Subscriber__c = True;
        updateuserList.add(userobj);
    }
    system.debug('updateuserList+++>'+updateuserList);
    update updateuserList;
}