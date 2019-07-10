trigger DeleteChildRecord2 on ObjectB__c (after insert, after update) {
	Set<Id> ObjBId = new Set<Id>();
    List<ObjectC__c> deleteobjCList = new List<ObjectC__c>();
    for(ObjectB__c objB : Trigger.new){
      ObjBId.add(objB.Id);  
    }
    List<ObjectC__c> objCList = [Select Id, Name, ObjectA__r.Test_Box__c, ObjectB__r.Close_Date__c from ObjectC__c
                                	Where ObjectB__c IN : ObjBId];
    for(ObjectC__c objC : objCList){
        if(objC.ObjectA__r.Test_Box__c == True && objC.ObjectB__r.Close_Date__c > system.today()){
            deleteobjCList.add(objC);
        }
    }
    delete deleteobjCList;
}