({
	saveFun : function(component, event, helper) {
		var action = component.get('c.saveMethod');
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var returnvalue = response.getReturnValue();
                component.set('v.message', returnvalue);
            }else if(state === 'INCOMPLETE'){
                
            }else if(state === 'ERROR'){
                var error = response.getError();
            }else{
                
            }
        });
        $A.enqueueAction(action);
	}
})