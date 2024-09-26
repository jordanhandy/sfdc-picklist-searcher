# Salesforce Flow Picklist Searcher

Given an object and field (API names), use the Apex and Test classes within a flow to be able to parse the active valid values for the picklist field.

This allows us, within flows, to be able to add these valid values to picklist choice sets within Salesforce Flows.  There is currently an issue in Salesforce Flows where certain objects cannot be queried for their picklists to be used in choice sets.  Once of these objects is the `Knowledge__kav` object (see screenshot).

## Error
As mentioned above, when trying to query a picklist or multi-picklist field for a choice set within a flow, you may be met with this error.  Using Apex allows us to avoid errors such as these

<img width="423" alt="image" src="https://github.com/user-attachments/assets/1cf07121-47a2-4a56-9db2-cdae517c223e">


## Usage
By moving this task over to Apex, we do the following:
1. Query all valid values from the object and field in question
2. Those values are returned to an Apex-defined variable type called `FlowMapClass`
  - Maps, as defined in Apex, are at this point not allowed to be used in Flows.  By using a custom variable similar to Maps, we can theoretically store a key-value pair for the picklist API name and picklist label values if we wanted
  - The `FlowMapClass` variable included in this repo contains an `altValue` parameter where a single record can be `key-value-altValue`
3. After returning a collection of `FlowMapClass` values, we can then use this within a picklist choice set, and not be barred by Flow limitations

<img width="708" alt="image" src="https://github.com/user-attachments/assets/63c11dde-ecb0-43f6-91ff-46067e0fa3b7">
<img width="923" alt="image" src="https://github.com/user-attachments/assets/e09082bb-d535-4492-baa9-12448fd28803">
<img width="469" alt="image" src="https://github.com/user-attachments/assets/11b95a9a-13a2-47f9-99a6-65ec2acf5cc2">



