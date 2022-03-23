trigger VehicleTriggerr on Contract(before insert, before update) {

    List<Account> accList = new List<Account>();
       
    for(Contract a : Trigger.New){
      
            accList.add(New Account(Name=a.Name + ' Account',                                   
                                  	AccountNumber=a.Id));
    }
    
    if (accList.size() > 0){
        insert accList;
    }
}