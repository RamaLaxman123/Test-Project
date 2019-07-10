global class ScheduleSendEmailBatch implements schedulable {
    global void execute(schedulableContext sc){
        SendEmailBatch batch = new SendEmailBatch();
        	Database.executeBatch(batch);
    }
}