Feature: User should be able to connect
     Say hello
     Get 1 spartan data

  Scenario: Say hello to hello endpoint
    Given url 'http://54.237.100.89:8000/api'
    And path 'hello'
    When method get
    Then status 200

  Scenario: Get 1 Spartan with Id 80
    Given url 'http://54.237.100.89:8000/api'
    And path '/spartans/80'
    When method GET
    Then status 200
