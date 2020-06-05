@meta_weather

  Feature: MetaWeather API tests

    Background: setup base URL
      * url 'https://www.metaweather.com/api'
      # url --> is a keyword from karate

      Scenario: Search for London
        # path --> is the path param
        Given path '/location/search'
        And param query = 'London'
        # method --> type of request
        When method get
        # method \w+ -->\w+ matches one or more word characters
        # (same as [a-zA-Z0-9_]+ ). \. matches the dot (.)
        Then status 200
        And match response[0] contains {title: 'London'}
        # [0] means --> take first object (line)  in response
        And match each response contains {title: 'London'}
        * print karate.pretty(response)

        Scenario Outline: Verify that city <query> exist
          Given path '/location/search'
          And param query = '<query>'
          When method get
          Then status 200
          And match each response contains {title: '<query>'}
          * print karate.pretty(response)

          Examples: cities
            | query    |
            | New York |
            | London   |
            | Boston   |






