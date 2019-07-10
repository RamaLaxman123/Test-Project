trigger DeleteRecordBasedonParent on ObjectC__c (after insert, after update) {
	Set<Id> ObjCId = new Set<Id>();
    List<ObjectC__c> deleteobjCList = new List<ObjectC__c>();
    for(ObjectC__c objC : Trigger.new){
      ObjCId.add(objC.Id);  
    }
    List<ObjectC__c> objCList = [Select Id, Name, ObjectA__r.Test_Box__c, ObjectB__r.Close_Date__c from ObjectC__c
                                	Where Id IN : ObjCId];
    for(ObjectC__c objC : objCList){
        if(objC.ObjectA__r.Test_Box__c == True && objC.ObjectB__r.Close_Date__c > system.today()){
            deleteobjCList.add(objC);
        }
    }
    delete deleteobjCList;
}