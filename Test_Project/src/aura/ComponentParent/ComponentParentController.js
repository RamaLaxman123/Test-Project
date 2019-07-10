({
	show : function(component, event, helper) {
		var result = event.getParams('eventname');
        component.set("v.res",result.eventname);
	}
})