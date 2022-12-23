public with sharing class CustomerTriggerHandler {
    
     // Question 1.b-c //
    public static void updateRelatedPayments(List<Customer__c> triggerOld){
        Set<Id> active =new Set<Id>();
        Set<id> inactive=new Set<Id>();
        //Collecting active and inactive account Ids seperately
        for(Customer__c c: triggerOld){
            if(c.active__c ==true){
                active.add(c.id);
            }else{
                inactive.add(c.id);
            }
        }
        //Find all the related payment records of all active Customer records
        if(!active.isEmpty()){
            List<Payments__c> payments1 =[select id from Payments__c where Customer__c in :active];
            if(!payments1.isEmpty())
                delete payments1;
        }
        //Find all the related 'Online' payment records of all inactive Customer records
        if(!Inactive.isEmpty()){
            List<Payments__c> onlines=[select id from Payments__c where Customer__c in :inactive and Mode__c='Online'];
            if(!onlines.isEmpty())
                delete onlines;
        }
    }

    // Question 1.a //
    public static void createDefaultPayments(List<Customer__c> triggerNew){
        
        List<Payments__c> defaultPaymentsList = new List<Payments__c>();
        
        for(Customer__c c : triggerNew){

            Payments__c pCrypto = new Payments__c();
            pCrypto.Mode__c = 'Crypto';
            pCrypto.Customer__c = c.id;
            pCrypto.Amount__c = 1;
            defaultPaymentsList.add(pCrypto);

            Payments__c pOnline = new Payments__c();
            pOnline.Mode__c = 'Online';
            pOnline.Customer__c = c.id;
            pOnline.Amount__c = 0.1;
            defaultPaymentsList.add(pOnline);
        }
        if(!defaultPaymentsList.isEmpty()){
            Insert defaultPaymentsList;
        }
    }
}
