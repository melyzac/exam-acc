@isTest
public class TestProductBatch {
@isTest
    public static void ProTest(){
        list<Account> lspro = new list<Account>();
         for(integer i=0;i<20;i++){
             account vObj = new account();
             vObj.Name = 'test Productos' + i;
             lspro.add(vObj);
         }
        
        insert lsPro;
        
        ProductBatch pro = new ProductBatch();
        database.executeBatch(pro);
    }
}