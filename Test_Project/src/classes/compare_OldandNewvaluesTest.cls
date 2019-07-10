@isTest
public class compare_OldandNewvaluesTest {
    public static testmethod void checkAccounts(){
        //List<Account> insertAccountList = new List<Account>();
        Account acc1 = new Account();
        	acc1.Name = 'Test1';
        	acc1.Phone = '9885488510';
        insert acc1;        
       		acc1.Name = 'Demo';
        	acc1.Phone = '9108147676';
        update acc1;
        	acc1.Phone = '9108147678';
        	acc1.Name = 'Demo';
        update acc1;
    }
}