({  
      
    fetchAddr : function(component, event, helper) {  
          
        component.set('v.mycolumns', [  
            {label: 'Account Name', fieldName: 'Name', type: 'text'},  
            {label: 'Billing State', fieldName: 'BillingState', type: 'text'},  
            {label: 'Billing City', fieldName: 'BillingCity', type: 'Text'}  
        ]);  
          
        var action = component.get("c.fetchAddresses");  
        action.setCallback(this, function(response) {  
              
            var state = response.getState();  
            if ( state === "SUCCESS" ) {  
                  
                component.set( "v.acctList", response.getReturnValue().listAcct );  
                component.set( "v.markers", response.getReturnValue().listAddrWrap );  
                  
            }  
              
        });  
        $A.enqueueAction( action );  
          
    }  
      
})