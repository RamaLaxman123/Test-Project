trigger DeleteChildRecord1 on ObjectA__c (after insert, after update) {
	Set<Id> ObjAId = new Set<Id>();
    List<ObjectC__c> deleteobjCList = new List<ObjectC__c>();
    for(ObjectA__c objA : Trigger.new){
      ObjAId.add(objA.Id);  
    }
    List<ObjectC__c> objCList = [Select Id, Name, ObjectA__r.Test_Box__c, ObjectB__r.Close_Date__c from ObjectC__c
                                	Where ObjectA__c IN : ObjAId];
    for(ObjectC__c objC : objCList){
        if(objC.ObjectA__r.Test_Box__c == True && objC.ObjectB__r.Close_Date__c > system.today()){
            deleteobjCList.add(objC);
        }
    }
    delete deleteobjCList;
}