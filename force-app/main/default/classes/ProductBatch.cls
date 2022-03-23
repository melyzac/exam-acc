public class ProductBatch implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator(
        'SELECT Name FROM Account'
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Account> vlist){
        List<Vehiculo__c>vehiculos = new List<Vehiculo__c>();
        for(Account veh: vlist){
            Vehiculo__c vObj = new Vehiculo__c();
            vObj.Modelo__c = veh.Modelo__c;
            vObj.Color__c = veh.Color__c;
            vObj.Marca__c = veh.Marca__c;
            vehiculos.add(vObj);
        }
        
        if(!vehiculos.isEmpty()){
            insert vehiculos;
        system.debug('La operación finalizó con éxito');
        }
    }
    
    public void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status,NumberOfErrors, JobItemsProcessed,TotalJobItems FROM AsyncApexJob WHERE Id=:bc.getJobId()];
    
    	system.debug('job==>'+job);
    }
}
