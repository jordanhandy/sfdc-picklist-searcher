@isTest
 public class TestGetPicklistValues {
   @isTest
     public static void testGetPicklistVals(){
         GetPicklistValues.FlowInput input = new GetPicklistValues.FlowInput();
         List<GetPicklistValues.FlowInput> inputs = new List<GetPicklistValues.FlowInput>();
         List<GetPicklistValues.FlowOutput> outputs = new List<GetPicklistValues.FlowOutput>();
         input.fieldName = 'Keywords__c';
         input.objectName = 'Knowledge__kav';
         inputs.add(input);
         
         Test.startTest();
         outputs = GetPicklistValues.picklistValues(inputs);
         Test.stopTest();
         Assert.isTrue(outputs[0].fmc.size() > 0);
         System.debug(outputs[0].fmc[0].key);
     }
 }