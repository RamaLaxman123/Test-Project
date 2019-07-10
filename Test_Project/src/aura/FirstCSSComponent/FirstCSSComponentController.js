({
	call : function(component, event, helper) {
		var name = component.get("v.name");
        component.set("v.name",'Laxman');
        var price = component.get("v.price");
        var quant = component.get("v.quant");
        var total = (price*quant);
        component.set("v.total",total);
	}
})