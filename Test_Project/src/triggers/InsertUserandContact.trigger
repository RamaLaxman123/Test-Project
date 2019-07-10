trigger InsertUserandContact on Account (after insert) {
    for(Account acc : Trigger.new){
        Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
        insert con;
    }
    UtilityClassinsertUser.insertUserwithRole('laxman@rama.com', 'redla', 'laxman.r2011@gmail.com', 'laxman Redladinne');
}