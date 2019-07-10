public class Helloworldclass {
	@AuraEnabled
    public static String saveMethod(){
        String message = 'This is laxman';
        return message;
    }
}