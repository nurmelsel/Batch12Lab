public with sharing class SoqlDEMO {
   public static void searchAcc() {
    list<account> accList=[SELECT id,name,annualRevenue from account where name like 'United\%%'];
    system.debug(accList);
   }
}
