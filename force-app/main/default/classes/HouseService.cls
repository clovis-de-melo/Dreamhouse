public with sharing class HouseService {
  // @AuraEnabled allows this class to be accessible from lightning web components
  @AuraEnabled(cacheable=true)
  public static List<House__c> getRecords() {
    try {
      // Create a list of House records from a SOQL query
      List<House__c> lstHouses = [
        SELECT Id, Name, Address__c, State__c, City__c, Zip__c
        FROM House__c
        WITH USER_MODE
        ORDER BY CreatedDate
        LIMIT 10
      ];
      // Return records from the house object
      return lstHouses;
    }
    // Code to handle exception
    catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
