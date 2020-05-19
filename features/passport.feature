Feature: Check passport
  In order to check passport validity
  As a client software developer
  I need to be able to check them through the API.

  Scenario: Check a valid passport number - not presented in invalid DB
    Given the following passports exists:
      | number     |
      | 6704219355 |
    When I add "Content-Type" header equal to "application/ld+json"
    And I add "Accept" header equal to "application/ld+json"
    And I send a "GET" request to "/api/passport/1234123456"
    Then the response status code should be 404

  Scenario: Check a invalid passport number - presented in invalid DB
    Given the following passports exists:
      | number     |
      | 6704219355 |
    When I add "Content-Type" header equal to "application/ld+json"
    And I add "Accept" header equal to "application/ld+json"
    And I send a "GET" request to "/api/passport/6704219355"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json; charset=utf-8"
    And the JSON node "number" should be equal to the number 6704219355
