public class SyncCountOfContact implements Database.Batchable<SObject>,Database.Stateful {
    public List<Account> toBeUpdate = new List<Account>();
    public Map<String,Integer> accIdVSCount = new Map<String,Integer>();

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,Name,AccountId From Contact Where AccountId != null');   
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        System.debug('scope '+scope);
        for(SObject obj : scope){
            Contact con = (contact) obj;
            if(accIdVSCount.containskey(con.AccountId)){
                Integer count = accIdVSCount.get(con.AccountId);
                count++;
                accIdVSCount.put(con.AccountId,count);
            }
            else{
                accIdVSCount.put(con.AccountId,1);
            }
        }
        System.debug('accIdVSCount '+accIdVSCount);
        for(String accId : accIdVSCount.keyset()){
            Account acc = new Account();
            acc.Id = accId;
            acc.Number_of_Contacts__c = accIdVSCount.get(accId);
            toBeUpdate.add(acc);
            System.debug('acc '+acc);
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('toBeUpdate '+toBeUpdate);
        if(toBeUpdate.size() > 0 ){
            update toBeUpdate;
        }
    }

}