global class scheduleEmailNotification implements Schedulable {
    global void execute(SchedulableContext sc) {
        EmailNotification email = new EmailNotification();
        Database.executeBatch(email);
    }
}