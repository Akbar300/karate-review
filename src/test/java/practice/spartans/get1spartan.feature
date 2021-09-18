Feature: User should be able to connect
     Say hello
     Get 1 spartan data

  Background:
    Given url spartan_api_url

  Scenario: Say hello to hello endpoint

    Given path 'hello'
    When method get
    Then status 200
    And print response
    And match response == 'Hello from Sparta'

  Scenario: Get 1 Spartan with Id 80

    Given path '/spartans/80'
    When method GET
    Then status 200
    # {"id":80,"name":"JT","gender":"Male","phone":1231231231}
    Then match response.id == 80
    Then match response contains {"id":80}
    Then match response.name == "JT"
    # just check the entire json body directly
    Then match response == {"id":80,"name":"JT","gender":"Male","phone":1231231231}


