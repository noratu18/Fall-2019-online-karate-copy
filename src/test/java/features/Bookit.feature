@bookit
  Feature: Book-it API tests

    Background: setup
      * url 'https://cybertek-reservation-api-qa.herokuapp.com'
      # controller to sign in
      * path '/sign'
      * param email = 'teacherva5@gmail.com'
      * param password = 'maxpayne'
      * method get
      # to get token def --> is a general variable
      * def token = response.accessToken
      * print "Token: ", token

     Scenario: Get all rooms
       # /api/rooms --> path params
       Given path '/api/rooms'
       # token --> coming from the above background line 10
       * header Authorization = token
       When method get
       Then status 200
       * print karate.pretty(response)


