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
  