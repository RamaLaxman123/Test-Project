public class AccountUtils {
    public Static List<Account> accountsByState(String billingstate){
        List<Account> acclist = new List<Account>();
        acclist = [Select Id, Name, BillingState from Account where BillingState =: billingstate];
        return acclist;
    }
}