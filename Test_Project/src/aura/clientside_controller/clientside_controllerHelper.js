({
	fun : function(component,event) {
		var button = event.getSource();
        var msg = button.get('v.label');
        var result = 'You have clicked on '+msg;
        component.set("v.result",result);
	}
})