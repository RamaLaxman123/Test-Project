public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        res = http.send(req);
        if(res.getStatusCode() == 200 || res.getStatusCode() == 201){
            Map<String,Object> result = (Map<String,Object>) Json.deserializeUntyped(res.getBody());
            System.debug('result>>>'+result);
            List<Object> animals = (List<Object>) result.get('animals');
            System.debug('animals>>>'+animals);
            for(Object animal : animals){
                System.debug('animal***'+animal);
            }
        }
        
        return res;
    }
    public Static HttpResponse makePostCallout(){
       Http http = new Http();
       HttpRequest req = new HttpRequest();
       HttpResponse res = new HttpResponse();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('POST');
        req.setHeader('content-Type', 'application/json;charset=UTF-8');
        req.setBody('{"name":"mighty moose"}');
        res = http.send(req);
        
        if(res.getStatusCode() == 200 || res.getStatusCode() == 201){
            system.debug('body***'+res.getBody());
        }else{
            system.debug(res.getStatus()+':::'+res.getStatusCode());
        }
        
       return res;
    }
}