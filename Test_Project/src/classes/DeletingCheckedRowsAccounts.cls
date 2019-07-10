public class DeletingCheckedRowsAccounts {
    public List<WrapperClass> listWrapper {get;set;}
    public Boolean allBool {get;set;}
	List<Account> listAccount {get;set;}
    
    public DeletingCheckedRowsAccounts() {
        listWrapper = new List<WrapperClass>();
        listAccount = [SELECT Id, Name, Phone, Industry FROM Account];
        if(listAccount.size() > 0) {
            for(Account acc : listAccount) {
                listWrapper.add(new WrapperClass(acc));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checked {get;set;}
        public Account acc {get;set;}
        public WrapperClass(Account a) {
            this.acc = a;
        }
    }
    
    public void del() {
        List<Account> listAccForDel = new List<Account>();
        List<WrapperClass> listTempWrapper = new List<WrapperClass>();
        for(WrapperClass w : listWrapper) {
            if(w.checked) {
                listAccForDel.add(w.acc);
            } else {
                listTempWrapper.add(w);
            }
        }
        if(listAccForDel.size() > 0) {
            delete listAccForDel;
            listWrapper = listTempWrapper;
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Select atleast one employee to delete'));
        }
    }
    
    public void selectAll() {
        if(allBool) {
            for(WrapperClass w : listWrapper) {
                w.checked = true;
            }
        } else {
            for(WrapperClass w : listWrapper) {
                w.checked = false;
            }
        }
    }
}