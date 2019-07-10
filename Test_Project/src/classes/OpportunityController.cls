public class OpportunityController {
	 private final Opportunity o;
    
    public OpportunityController(ApexPages.StandardController stdController) {
        this.o = (Opportunity)stdController.getRecord();
    }
     
    // Code we will invoke on page load.
    public PageReference autoRun() {
 
        String theId = ApexPages.currentPage().getParameters().get('id');
 
        if (theId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }
 
        for (Opportunity o:[select id, name from Opportunity where id =:theId]) {
            // Do all the dirty work we need the code to do
        }
 
        // Redirect the user back to the original page
        PageReference pageRef = new PageReference('/' + theId);
        pageRef.setRedirect(true);
        return pageRef;
 
    }
}