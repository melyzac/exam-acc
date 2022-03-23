@isTest
public class VehicleTriggerTest {

    @isTest static void TestTrigger(){
        Account acct = new Account(Name='Test Account');
        
        insert acct;
        
        Contract cont = new Contract(Name=acct.Name);
        
        insert cont;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             result.getErrors()[0].getMessage());
    
    }
}