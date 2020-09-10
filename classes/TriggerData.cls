/*------------------------------------------------------------
Author:        Ian Huang
Company:       Salesforce
Description:   Trigger template - Trigger Data class
------------------------------------------------------------*/
public class TriggerData {

	public Enum TriggerEvent { beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete }
	public TriggerEvent tEvent;
	
	public List<SObject> oldList   { get; private set; }
	public List<SObject> newList   { get; private set; }
	
    public Map<Id, SObject> oldMap { get; private set; }
	public Map<Id, SObject> newMap { get; private set; }
    
    public Set<Id> oldIdSet        { get; private set; }
    public Set<Id> newIdSet        { get; private set; }
    
	public String triggerObject    { get; private set; }
    public Boolean isExecuting     { get; private set; }
	
	public TriggerData(List<SObject> olist, 
                       List<SObject> nlist,
                       Map<Id, SObject> omap, Map<Id, SObject> nmap,
  				       Boolean ib, Boolean ia, 
                       Boolean ii, Boolean iu, Boolean id, Boolean iud, 
                       Boolean isExecuting) {
		this.oldList = olist;
		this.newList = nlist;
		this.oldMap = omap;
		this.newMap = nmap;
		this.triggerObject = getSObjectTypeName((this.oldList != null && this.oldList.size() > 0) ? this.oldList[0] : this.newList[0]);
		if (ib & ii) tEvent = TriggerEvent.beforeInsert;
		else if (ib && iu) tEvent = TriggerEvent.beforeUpdate;
		else if (ib && id) tEvent = TriggerEvent.beforeDelete;
		else if (ia && ii) tEvent = TriggerEvent.afterInsert;
		else if (ia && iu) tEvent = TriggerEvent.afterUpdate;
		else if (ia && id) tEvent = TriggerEvent.afterDelete;
		else if (ia && iud) tEvent = TriggerEvent.afterUndelete;
		isExecuting = isExecuting;
                           
        this.oldIdSet = getReocrdIdSet(this.oldList);
        this.newIdSet = getReocrdIdSet(this.newList);                           
	}
    
    private String getSObjectTypeName(SObject obj) {
        return obj.getSObjectType().getDescribe().getName();
    }
    
    private Set<Id> getReocrdIdSet(List<sObject> records) {
        Set<Id> result = new Set<Id>();
        if(records != null && !records.isEmpty()) {
            for(sObject obj :records) {
                result.add(obj.Id);
            }
        }
        return result;
    }
}