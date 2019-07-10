@RestResource(urlMapping='/createAccount')
global class FetchAccountDetails {
    public class AccountWrapper{
        public String Name;
        public String phone;
        public String typeofloan;
        public String panNumber;
        public String aadharNumber;
        public String amount;
    }
    global class Response{
        public String Message;
        public AccountWrapper wrap;
        global Response(){
            Message = '';
            wrap = new AccountWrapper();
        }
    }
    @httpPost
    global Static Response createRecords(){
        RestRequest req = RestContext.request;
        Response res = new Response();
        if(req == null || req.requestBody == null){
            res.Message = 'Request is null so Data won\'t be Created';
            return res;
        }else{
            try{
                String jsondata = req.requestBody.toString();
                system.debug('Request body***'+jsondata);
                AccountWrapper wrapclass = (AccountWrapper)json.deserialize(jsondata, AccountWrapper.class);
                system.debug('jsondata:::'+wrapclass);
                List<Account> acclist = new List<Account>();
                acclist = [Select Id, Name, PAN_Number__c, Aadhar_Number__c From Account];
                    if(acclist[0].PAN_Number__c == wrapclass.panNumber || acclist[0].Aadhar_Number__c == wrapclass.aadharNumber){
                       res.Message = 'Record already existed';
            			return res; 
                    }else{
                        Account acc = new Account();
                        acc.Name = wrapclass.Name;
                        acc.Aadhar_Number__c = wrapclass.aadharNumber;
                        acc.PAN_Number__c = wrapclass.panNumber;
                        acc.Phone = wrapclass.phone;
                        insert acc;
                        
                        Contact con = new Contact();
                        con.LastName = acc.Name;
                        con.AccountId = acc.Id;
                        insert con;
                    }
            }catch(Exception ex){
                system.debug('Exception:::'+ex.getMessage()+'Line No::::'+ex.getLineNumber());
            }
        }
        return res;
    }
}