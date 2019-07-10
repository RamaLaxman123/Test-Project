trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasklist = new List<Task>();
    for(Opportunity opp : Trigger.New){
        if(opp.StageName == 'Closed Won'){
            Task taskobj = new Task();
            	taskobj.Subject = 'Follow Up Test Task';
            	taskobj.WhatId = opp.Id;
            	tasklist.add(taskobj);
        }
    }
    if(tasklist.size() > 0){
        insert tasklist;
    }
}