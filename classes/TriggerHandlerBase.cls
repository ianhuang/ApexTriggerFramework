/*------------------------------------------------------------
Author:        Ian Huang
Company:       Salesforce
Description:   Trigger template - Trigger handler base class
------------------------------------------------------------*/
public abstract class TriggerHandlerBase implements Triggers.IHandler {
    
    private static final Integer DEFAULT_EXECUTION_COUNT = 999;
    public Integer maximumExecutionCount;
    
    protected TriggerDataManagerBase dataManager  {get; set;}
    protected TriggerData            triggerData  {get; set;}

    public TriggerHandlerBase() {
        this.maximumExecutionCount = DEFAULT_EXECUTION_COUNT;
    }
    
    public TriggerHandlerBase setMaximumExecutionCount(Integer maxExecutionCount) {
        this.maximumExecutionCount = maxExecutionCount;
        return this;
    }
    
    public abstract void handle();
    
    protected abstract List<sObject> getFilteredRecords();
    
    public virtual void bindDataManager(TriggerDataManagerBase dataManager) {
        this.dataManager = dataManager;
    }

    public virtual void bindTriggerData(TriggerData triggerData) {
        this.triggerData = triggerData;
    }
    
    protected Set<Id> getReocrdIdSet(List<sObject> records) {
        Set<Id> result = new Set<Id>();
        for(sObject obj :records) {
            result.add(obj.Id);
        }
        return result;
    }

}