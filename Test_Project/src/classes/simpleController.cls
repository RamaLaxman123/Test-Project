public with sharing class simpleController {
	
	public List<Contact> contacts = new List<Contact>();
	
	public simpleController() {
		for (Contact c : [SELECT Account.Name, Email, FirstName, Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT 100]) { 
			contacts.add(c); 
		}
	}
	public List<Contact> getContacts() {
		return contacts; 
	}
}