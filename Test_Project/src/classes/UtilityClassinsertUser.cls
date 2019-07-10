public class UtilityClassinsertUser {
	@future
    public static void insertUserwithRole(String uname, String al, String em, String lname){
        Profile p = [Select Id, Name from Profile where Name = 'Standard User'];
        system.debug('**profile**'+p);
        UserRole r = [Select Id, Name from UserRole where Name = 'COO'];
        system.debug('**Role**'+r);
        User u = new User();
        	u.Username = uname; 
        	u.Alias = al;
        	u.Email = em;
        	u.LastName = lname;
        	u.ProfileId = p.Id;
        	u.UserRoleId = r.Id;
        	u.EmailEncodingKey = 'UTF-8';
        	u.LanguageLocaleKey = 'en_US';
        	u.LocaleSidKey = 'en_US';
        	u.TimeZoneSidKey = 'America/Los_Angeles';
        insert u;
        system.debug('**User**'+u);
    }
}