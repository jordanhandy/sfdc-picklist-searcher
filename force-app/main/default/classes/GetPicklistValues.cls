public class GetPicklistValues {
     @InvocableMethod(label='Get Active Picklist Values' description='Returns active picklist field values from an object that cannot otherwise be queried by flow' category='Support Tools')
     public static List<FlowOutput> picklistValues(List<FlowInput> input) {
         // input variables
         String objectName = input.get(0).objectName;
         String fieldName = input.get(0).fieldName;
         

         
         List<FlowOutput> flowOutList = new List<FlowOutput>();
         FlowOutput flowOut = new FlowOutput();
         
         List<FlowMapClass> fmcList = new List<FlowMapClass>();
         List<Schema.DescribeSobjectResult> results = Schema.describeSObjects(new List<String>{objectName});
         
         for(Schema.DescribeSobjectResult res : results) {    
             for (Schema.PicklistEntry entry : res.fields.getMap().get(fieldName).getDescribe().getPicklistValues()) {
                 if (entry.isActive()) {
                   // Custom class to create maps in flows
                   FlowMapClass fmc = new FlowMapClass();
                   fmc.key = entry.getValue();
                   fmc.value = entry.getLabel();
                   fmcList.add(fmc);
                 }
             }
         }
         // Add list as output variable
         // Add to output list variable
         // Return to flow
         flowOut.fmc = fmcList;
         flowOutList.add(flowOut);
         return flowOutList;
     }
     public class FlowInput{
         @InvocableVariable(label='Object API name' description='API name of object to search' required=true)
         public String objectName;
         @InvocableVariable(label='Field API name' description='API name of the field to use' required=true)
         public String fieldName;
     }
     public class FlowOutput{
         @InvocableVariable(label='List of value and label' description='List of value and label' required=true)
         public List<FlowMapClass> fmc;
     }
     
 }