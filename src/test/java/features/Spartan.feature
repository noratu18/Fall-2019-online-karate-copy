@spartan
Feature: Spartan API tests

  Background: setup
    * url 'http://54.196.47.224:8000'
    * def token = call read('basic-auth.js') {username: 'admin', password: 'admin'}
    * header Authorization = token


    Scenario: Get all spartans
      Given path '/api/spartans'
      When method get
      Then status 200
      * print karate.pretty(response)


    Scenario: Add new spartan and verify status code
      Given path '/api/spartans'
      # this Json body in """ if we need to write in separate line
          # we have to put our body in """
      * def spartan =
      """
      {
      "name": "Karate Women",
      "gender": "Female",
      "phone": 234512312415
      }
      """
      And request spartan
      When method post
      Then status 201
      And print karate.pretty(response)
      * def id = response.data.id
      * header Authorization = token
      Given path '/api/spartans/', id
      When method delete
      Then status 204
      * print id 'is deleted'
      * print karate.pretty(responseHeaders)


 #   Scenario: Delete spartan
 #     Given path '/api/spartans/121'
 #    When method delete
 #     Then status 204

  Scenario: Add new spartan from external JSON file
      Given path '/api/spartans'
    # def spartan = read('spartan.json') --> spartan is a variable
      * def spartan = read('spartan.json')
      # request spartan --> to provide body of request
      * request spartan
       When method post
    And print karate.pretty(response)
    Then status 201
    And assert response.success == 'A Spartan is Born!'


    Scenario: Update spartan
      Given path '/api/spartans/130'
      And request {name: 'Jiujiutsu Master', gender: 'Female'}
      And method patch
      * print karate.pretty(responseHeaders)
      Then status 204
      * header Authorization = token
      * path '/api/spartans/130'
      When method get
      * print karate.pretty(response)





