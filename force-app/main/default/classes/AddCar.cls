public with sharing class AddCar {
    public AddCar() {

      List<Vehiculo__c> addvehiculo = new List<Vehiculo__c>();
        Vehiculo__c vehiculo1 = New Vehiculo__c(Color__c = 'rojo',Marca__c = 'Honda',Modelo__c = '2015');
                
        addvehiculo.add(vehiculo1);

           insert addvehiculo;
        

        System.debug('Registro fue Creado ' + vehiculo1);
    }
    
    public static void listVeh(){
        
        List<Vehiculo__c> accList = new List<Vehiculo__c>{
            new Vehiculo__c(Color__c = 'Azul', Marca__c = 'Toyota', Modelo__c = '2010'),
            new Vehiculo__c(Color__c = 'Verde', Marca__c = 'Volskwagen', Modelo__c = '2013'),
            new Vehiculo__c(Color__c = 'Gris', Marca__c = 'Chevrolet', Modelo__c = '2012')
        };
            
            insert accList;
        
        List<Vehiculo__c> updateList = new List<Vehiculo__c>();
        for(Vehiculo__c con : accList){
            if(con.CreatedDate > system.today()){
                con.Color__c = 'Lista de Vehiculos actualizada';
                
                updateList.add(con);
            }
        }
    
	       update updateList; 
    }
}
