trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete) {
	 if ( trigger.isBefore ) {
        if ( trigger.isInsert ) {
              OpportunityHandlerController.onBeforeInsert(trigger.new);
      	} else if ( trigger.isUpdate ) {
              OpportunityHandlerController.onBeforeUpdate(trigger.new, trigger.oldMap);
     	} else if ( trigger.isDelete ) {
              OpportunityHandlerController.onBeforeDelete(trigger.old, trigger.oldMap);
        }
       } else if ( trigger.isAfter ) {
           if ( trigger.isInsert ) {
              OpportunityHandlerController.onAfterInsert(trigger.new);
       } else if ( trigger.isUpdate ) {
              OpportunityHandlerController.onAfterUpdate(trigger.new, trigger.oldMap);
       } else if ( trigger.isDelete ) {
              OpportunityHandlerController.onAfterDelete(trigger.old, trigger.oldMap);
       }
	}
}