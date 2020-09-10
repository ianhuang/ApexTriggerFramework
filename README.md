# Apex Trigger Framework
## A user story driven Force.com Apex trigger framework


## Summary
* Simplicity
* Readability 
* Separation of Concerns
* Multi-Dev Stream Friendly
* Order of Execution
* Muting

### Simplicity, Readability & Maintainability
* 2 level simple structure for easy access and readability
* Descriptive business scenario based trigger handler name for easy understanding of business purpose
* Easy maintenance of single purpose handler class

### Separation of Concerns
* Trigger - High level trigger execution flow
* Trigger handler class - Detailed business logic code
* Trigger Data class - Collection of all data from trigger context

### Multi Development Stream Friendly
* Single purpose handler class means developers will never override each other's code

### Order of Execution
* First binding first execution

### Data loading & DML Consolidation
* Consolidate common data loading in TriggerDataManager
* Consolidate DMLs in TriggerDataManager
* Virtual method (getReocrdIdSet) in TriggerHandlerBase class provide a way to "force" developers to restrict the data for trigger handler processing 

### Trigger bypass & Muting
* Configurable trigger muting
* Profile & user level control


### Framework Classes
* Triggers
* TriggerHandlerBase
* TriggerDataManagerBase
* TriggerParameters

## Sample Code 
Sample code can be found here:
https://github.com/ianhuang/AppFrameworkExamples
