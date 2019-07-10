public class MyCustomVFPage_CTR {
	public String AccountId {get;set;}
	public String ResponseCode {get;set;}
	public MyCustomVFPage_CTR () {
		AccountId = ApexPages.currentPage().getParameters().get('AccountId');
		ResponseCode = ApexPages.currentPage().getParameters().get('ResponseCode');
	}
	public PageReference InitPage() {
		List<Account> accountIssues = [SELECT Id, Name, Phone FROM Account WHERE Id=:AccountId LIMIT 1];
		if(!accountIssues.IsEmpty()){
			accountIssues[0].Phone = ResponseCode;
			UPDATE accountIssues;
		}
        return null;
	}
}