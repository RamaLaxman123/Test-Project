trigger SendApproval on Account (after insert, after update) {
        for (Account acc :  Trigger.new) {

        if (acc.Count_Of_Contacts__c != null) {
            Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
            approvalRequest.setComments('Offer Submitted for approval');
            approvalRequest.setObjectId(acc.Id);
            Approval.ProcessResult approvalResult = Approval.process(approvalRequest);
            System.debug('offer submitted for approval successfully: '+approvalResult .isSuccess());

        }

    }

}