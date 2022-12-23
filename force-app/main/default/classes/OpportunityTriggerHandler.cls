public class OpportunityTriggerHandler {
    public static void validateOppClosed(list<opportunity> triggerNew,list<opportunity> triggerOld,Map<id,opportunity> triggerNewMap,Map<Id,Opportunity> triggerOldMap) {
        set<id> oppIds=new set<id>();    
        for (opportunity op : triggerNew) {
            if(op.StageName != triggerOldMap.get(op.id).StageName && (op.StageName == 'Closed Won')  || op.StageName == 'Closed Lost'){
                oppIds.add(op.id);
            }
        }  

        List<Opportunity> listOppTask =[select id, stageName,(select id,status from Tasks where status != 'Completed' and status != 'Deferred' limit 1) from opportunity where  id in : oppIds];
        for (opportunity opp : listOppTask) {
            if(opp.Tasks != null && opp.Tasks.size()>0){
                Opportunity oppTriggerNew = triggerNewMap.get(opp.id);
                oppTriggerNew.StageName.addError('CANNOT CLOSED OPPORTUNITY,FİRST CLOSE ALL TASK,THEN COME BACK');
            }
            
        }

    }
}
