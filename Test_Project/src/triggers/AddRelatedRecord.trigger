trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id,(SELECT Id from Opportunities) from Account Where Id IN: Trigger.new]);
    for(Account acc : Trigger.new){
        System.debug('acctsWithOpps.get(acc.Id).Opportunities.size()=' + acctsWithOpps.get(acc.Id).Opportunities.size());
        if(acctsWithOpps.get(acc.Id).Opportunities.size() == 0){
            oppList.add(new Opportunity(Name=acc.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acc.Id));
        }
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}