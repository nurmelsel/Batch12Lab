trigger ContactTrigger on Contact (before insert,before update,after insert,after update) {
if(trigger.isBefore && trigger.isInsert){
    system.debug('==========BEFORE INSERT============');
    System.debug('trigger.new is '+trigger.new);
    System.debug('trigger.old is '+trigger.old);
    System.debug('trigger.newMap is = '+trigger.newMap);
    System.debug('trigger.oldMap is = '+trigger.oldMap);
}
if(trigger.isAfter&& trigger.isInsert){
    system.debug('==========AFTER INSERT============');
    System.debug('trigger.new is '+trigger.new);
    System.debug('trigger.old is '+trigger.old);
    System.debug('trigger.newMap is = '+trigger.newMap);
    System.debug('trigger.oldMap is = '+trigger.oldMap);
}

if(trigger.isBefore && trigger.isUpdate){
    system.debug('==========BEFORE UPDATE============');
    System.debug('trigger.new is '+trigger.new);
    System.debug('trigger.old is '+trigger.old);
    System.debug('trigger.newMap is = '+trigger.newMap);
    System.debug('trigger.oldMap is = '+trigger.oldMap);
}

if(trigger.isAfter && trigger.isUpdate){
    system.debug('==========AFTER UPDATE============');
    System.debug('trigger.new is '+trigger.new);
    System.debug('trigger.old is '+trigger.old);
    System.debug('trigger.newMap is = '+trigger.newMap);
    System.debug('trigger.oldMap is = '+trigger.oldMap);
}


map<id, account> trgNewMap = trigger.newMap;
map<id, account> trgOldMap = trigger.oldMap;



}
