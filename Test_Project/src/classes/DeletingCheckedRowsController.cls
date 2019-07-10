public class DeletingCheckedRowsController {
    public List<WrapperClass> listWrapper {get;set;}
    public Boolean allBool {get;set;}
    
    public DeletingCheckedRowsController() {
        listWrapper = new List<WrapperClass>();
        List<Employee__c> listEmp = [SELECT Id, Name, Age__c FROM Employee__c];
        if(listEmp.size() > 0) {
            for(Employee__c emp : listEmp) {
                listWrapper.add(new WrapperClass(emp));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checked {get;set;}
        public Employee__c emp {get;set;}
        public WrapperClass(Employee__c emp) {
            this.emp = emp;
        }
    }
    
    public void del() {
        List<Employee__c> listEmpForDel = new List<Employee__c>();
        List<WrapperClass> listTempWrapper = new List<WrapperClass>();
        for(WrapperClass w : listWrapper) {
            if(w.checked) {
                listEmpForDel.add(w.emp);
            } else {
                listTempWrapper.add(w);
            }
        }
        if(listEmpForDel.size() > 0) {
            delete listEmpForDel;
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