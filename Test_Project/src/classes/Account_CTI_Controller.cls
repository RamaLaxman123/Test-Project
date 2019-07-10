public class Account_CTI_Controller {
    public Account accoutobj{get;set;}
    public String currentRecordId {get;set;}
	public String parameterValue {get;set;}
    
    public Account_CTI_Controller(ApexPages.StandardController controller) {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
		accoutobj = [SELECT Id, Name, Phone FROM Account WHERE Id =:currentRecordId];
        parameterValue = ApexPages.CurrentPage().getparameters().get('nameParam');
		
    }
}