Feature: User should be able to Create Read Update Delete 
  
  Background: 
    Given url spartan_api_url
    
    Scenario: Creating new Spartan 
      When path '/spartans'
      And header Content-Type = 'application/json'
      And request
      """
          {
            "name": "Jamal",
            "gender": "Male",
            "phone": 3123781237
          }
      """
      When method POST
      Then status 201

      # optionally send another get request to get this data
      * def newID = response.data.id
      Given path '/spartans' , newID
      When method GET
      Then status 200
      And match response.name == "Jamal"


      # test will fail if data does not exist
      Scenario: Updating Existing Spartan
        Given path '/spartans/2700'
        And header Content-Type = 'application/json'
        And request
        """
            {
              "name": "Asiya",
              "gender": "Female",
              "phone": 1231231234
            }
        """
        When method PUT
        Then status 204

        # This is fragile because once deleted can test will fail
        Scenario: Deleting 1 Spartan
          Given path '/spartans/254'
          When method DELETE
          Then status 204

          #Given path '/spartans/253'
          When method GET
          Then status 404

        Scenario: Deleting 1 Spartan this time get the id dynamically
          Given path '/spartans'
          When method GET
          Then status 200
          # get first id from all spartan json array
          * def firstID = response[0].id
          * print firstID
          # use the id that was extracted from above request and saved into firstID
          # this is concatenating using comma , no / needed
          Given path '/spartans' , firstID
          When method DELETE
          Then status 204

          #Given path '/spartans/253'
          When method GET
          Then status 404