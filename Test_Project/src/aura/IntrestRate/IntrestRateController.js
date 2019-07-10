({
	show : function(component, event, helper) {
		var amount = component.get("v.amount");
        var years = component.get("v.years");
        var rate = component.get("v.rate");
        var intrest = (amount*years*rate)/100;
        component.set("v.intrest",intrest);
	},
    reset : function(component, event, helper){
        component.set("v.amount",0);
        component.set("v.years",0);
        component.set("v.rate",0);
        component.set("v.intrest",0);
    }
})