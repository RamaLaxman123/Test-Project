({
	invoke : function(component, event, helper) {
		var action = component.getEvent("firstEvent");
        action.setParams({"eventname":"Laxman First Event"});
        action.fire();
	}
})