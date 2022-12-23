public with sharing class AccConAndOppOperations {
    //Part 1 Question 1
    public static Decimal oppsSum(){     
        List<Opportunity> oppList = [select id, name, amount from opportunity where amount != null and stageName = 'Closed Won' ];
        decimal sum = 0;
        for (opportunity opp : oppList) {
            sum = sum + opp.amount;
        }
        System.debug('Sum   '+sum);
        return sum;
        //alternatif çözüm
        // AggregateResult sum2= [select sum(amount) from opportunity where amount != null and stageName = 'Closed Won'];
        // System.debug(sum2.get('expr0'));
   
        // AggregateResult sum2= [select sum(amount),max(amount) from opportunity where amount != null and stageName = 'Closed Won'];
        // System.debug(sum2);
   
      

        //alternatif çözüm:
        /* List<Opportunity> oppList = [select amount from opportunity where amount != null and stageName = 'Closed Won' ];
        decimal sum = 0;
        for (Integer i = 0; i < oppList.size(); i++) {
            sum = sum + oppList[i].Amount;
        }

        System.debug('ppppp :'+sum); */


    }
    //Part 1 Question 2
    public static List<Account> accountsWithAtLeastOneOpp(String oppstageName){
        List<Account> accountsList = new List<Account>();
        
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from opportunity Where StageName = : oppstageName)];
        System.debug('accountsList  '+accountsList);
        return accountsList;
        //ikinci yol
        // List<Account> accountsList = new List<Account>();
        // List<opportunity> listOpp=[Select AccountId from opportunity Where StageName = 'Closed Won'and accountId!=null];
        // set<id> listId=new set<id>();
        // for (opportunity opp : listOpp) {
        //     listId.add(opp.accountId);
        // }
        // accountsList = [Select Id, Name from Account Where Id In :listId];
        // system.debug(listId);
        // System.debug('accountsList  '+accountsList.size());
    }
    //PART 1 Question 3
    //Sol-A
    // public static List<Account> accountsWithAtLeastOneContact(){
    //     //Get the account Ids from all the contacts in the org
    //     List<Contact> contactsList = new List<Contact>();
    //     contactsList = [Select AccountId from Contact];
    //     Set<Id> accntIdsSet = new Set<Id>();
    //     for(Contact con : contactsList){
    //         accntIdsSet.add(con.AccountId);
    //     }
    //     List<Account> accountsList = new List<Account>();
    //     accountsList = [Select Id, Name from Account WHere Id In : accntIdsSet];
    //     System.debug('accountsList  '+accountsList);
    //     return accountsList;
    // }
    //Sol-B
    public static List<Account> accountsWithAtLeastOneContact1(){
        //Get the account Ids from all the contacts in the org
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Id, Name from Account Where Id In (Select AccountId from Contact)];
        System.debug('accountsList  '+accountsList);
        return accountsList;
    }



    //3.1

    public static void addCont(id accid) {
        account a1=[select id,name from account where id=:accid];
        contact c1=new contact();
        c1.lastname=a1.name;
        c1.accountid=a1.id;
        System.debug('contact has been created successfully ');
    
        insert c1;
    }
    //3.2
    public static void updateOpp() {
        list<opportunity> myOpp=[ select name, amount,description from Opportunity where amount >0 order by amount  desc limit 10 ];
         for(opportunity each: myOpp){
            each.description='This is one of the top 10 opportunities.Please work on this properly';
         }
         System.debug('all is good');
         update myOpp; 
    }
    //3.3
    public static list<opportunity> myOpp2(string acid,integer n) {
        account a1=[select id,name,annualrevenue from account where id=:acid ];
        list<opportunity> opp2=new List<Opportunity>();
        if(n>0){
            for (Integer i = 0; i < n; i++) {
                opportunity opp1=new opportunity();
                opp1.closedate=date.today().addyears(3);
                opp1.stagename='Prospecting';
                if(a1.annualrevenue!=null){
                    opp1.amount=a1.annualrevenue/n;
                }
                opp1.accountId=a1.id;
                opp1.name=a1.name;  
                opp2.add(opp1);
                System.debug(opp1);
            }
            insert opp2;
    
        }else{
            System.debug('“Please tell us how many opportunities needs to be created');
        }
    
        return opp2;   
    }
    //3.4
    public static void accNoCon() {
        list<account> listem= [select id ,name from account where id not in (select accountid from contact)];
        list<contact> kisiler= new list<contact>();
        for (account eachA : listem) {
            contact c1=new contact();
            c1.lastname=eachA.name;
            c1.accountid=eachA.id;
            kisiler.add(c1);
            System.debug(c1);
          
        }
        if(!kisiler.isEmpty()){
            insert kisiler;
        }
      
        
    }
    public static void temizlee() {
        list<opportunity> sonListe=[select name,amount from opportunity where amount<200000 and StageName='Closed Won'];
        System.debug(sonListe);
        delete sonListe;
        
    }
}
