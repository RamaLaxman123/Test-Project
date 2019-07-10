({
	show : function(component, event, helper) {
        var amount = component.get("v.amount");
        var rate = component.get("v.rate");
        var year = component.get("v.year");
		var interest = (amount*rate*year)/100;
        component.set("v.interest",interest);
	}
})