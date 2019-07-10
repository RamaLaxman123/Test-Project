({
	fun : function(component, event) {
		var button = event.getSource();
        var msg = button.get('v.label');
        component.set("v.Add",result);
	}
})