public class AccountTriggerHandler {
    public Static void CreateAccounts(List<Account> acclist){
        for(Account acc : acclist){
            acc.ShippingState = acc.BillingState;
        }
    }
}