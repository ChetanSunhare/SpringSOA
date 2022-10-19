public class ShowAccountController {
    @AuraEnabled
    public Static List<Account> fetchAccounts(){
        try{
            List<Account> accounts = [SELECT Id,Name,Phone From Account order by lastModifiedDate Limit 10];
        	return accounts;
        }catch(Exception e){
            new AuraHandledException(e.getStackTraceString());
            return null;
        }
    }

}