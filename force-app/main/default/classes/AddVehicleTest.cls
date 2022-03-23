@isTest
public class AddVehicleTest {
@isTest
    Public Static Void UnitTest(){
        list<Vehiculo__c> newV = new list<Vehiculo__c>();
        for(integer i=0;i<5;i++){
            Vehiculo__c v = new Vehiculo__c();
            v.Marca__c = 'Ford';
            v.Color__c = 'Gris';
            v.Modelo__c = '2014';
            newV.add(v);
        }
        insert newV;
    
    
        
    }
}