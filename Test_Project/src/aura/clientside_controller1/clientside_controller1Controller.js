({
	add : function(component, event, helper) {
        var button = event.getSource();
        var msg = button.get('v.label');
        var Add = '90';
        component.set("v.Aval",Add);
		
	},
    mul : function(component, event, helper) {
		var button = event.getSource();
        var msg = button.get('v.label');
        var Add = '80';
        component.set("v.Bval",Add);
	},
    can : function(component, event, helper) {
		var button = event.getSource();
        var msg = button.get('v.label');
        var Add = '170';
        component.set("v.Cval",Add);
	}
})