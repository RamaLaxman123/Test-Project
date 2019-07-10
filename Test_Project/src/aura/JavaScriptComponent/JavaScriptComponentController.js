({  
  
    callKeyUp : function(component, event, helper) {  
          
        if ( event.keyCode == 13 )  
            alert(component.get("v.strText"));  
          
    }  
      
})