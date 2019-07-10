public class Aura_Example {
	@AuraEnabled
    public Static String invokeMethod(){
        String result = 'The Server side Controller';
        return result;
    }
}