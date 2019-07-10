public with sharing class RESTAPIJSONResponseController {

    public List < JSONWrapper > listWrapper {get;set;}
    
    public RESTAPIJSONResponseController() {
        listWrapper = new List < JSONWrapper >();
    }
    
    public void fetchAPI( ){
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndPoint('https://api.github.com/users/hadley/orgs');
        req.setMethod('GET');
        HTTPResponse res = h.send(req);  
        JSONParser parser = JSON.createParser(res.getBody());
        listWrapper = (List < JSONWrapper >) JSON.deSerialize(res.getBody(), List < JSONWrapper >.class);
        /*
           If the response contains only one value instead list, then you can use the below code
           JSONWrapper obj = (JSONWrapper) JSON.deSerialize(res.getBody(), JSONWrapper.class); 
           listWrapper.add(obj);
        */
    }
    
    public class JSONWrapper {
        public String login {get;set;}
        public String id {get;set;}
        public String url {get;set;}
        public String repos_url {get;set;}
        public String events_url {get;set;}
        public String hooks_url {get;set;}
        public String issues_url {get;set;}
        public String members_url {get;set;}
        public String public_members_url {get;set;}
        public String avatar_url {get;set;}
        public String description {get;set;}
    }
    
}