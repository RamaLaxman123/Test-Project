public class AccountListController1{
      
    @AuraEnabled  
    public static Wrapper fetchAddresses() {  
          
        List < CompleteAddressWrapper > listAddrWrap = new List < CompleteAddressWrapper >();  
        List < Account > listAcct = new List < Account >();  
        Wrapper wrap = new Wrapper();  
           
        for ( Account acc: [ SELECT Id, Name, BillingStreet, BillingState, BillingCountry, BillingPostalCode,  
                                    BillingCity, BillingLatitude, BillingLongitude  
                               FROM Account   
                              WHERE BillingStreet != null   
                              LIMIT 100 ] ) {  
              
            AddressWrapper addrWrap = new AddressWrapper();       
            CompleteAddressWrapper objWrap = new CompleteAddressWrapper();  
            addrWrap.Street = acc.BillingStreet;  
            addrWrap.City = acc.BillingCity;  
            addrWrap.State = acc.BillingState;  
            addrWrap.Country = acc.BillingCountry;  
            addrWrap.PostalCode = acc.BillingPostalCode;  
            objWrap.location = addrWrap;  
            objWrap.icon = 'custom:custom32';  
            objWrap.title = acc.Name;  
            listAddrWrap.add(objWrap);  
            listAcct.add(acc);  
              
        }   
          
        wrap.listAcct = listAcct;  
        wrap.listAddrWrap = listAddrWrap;  
        system.debug('Out ' + listAddrWrap);  
        return wrap;  
          
    }  
      
    public class Wrapper {  
          
        @AuraEnabled  
        public List < Account > listAcct;  
        @AuraEnabled  
        public List < CompleteAddressWrapper > listAddrWrap;  
          
    }  
      
    public class AddressWrapper {  
      
        @AuraEnabled   
        public String Street;  
        @AuraEnabled   
        public String City;  
        @AuraEnabled   
        public String State;  
        @AuraEnabled   
        public String Country;  
        @AuraEnabled   
        public String PostalCode;  
          
    }  
      
    public class CompleteAddressWrapper {  
          
        @AuraEnabled   
        public String title;  
        @AuraEnabled   
        public String icon;  
        @AuraEnabled   
        public AddressWrapper location;  
          
    }  
      
}