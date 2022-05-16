Feature: Login existing account in Reqres

    As a user, I want to be able to login an existing account
    So that I will be able to access the site

    @positive
    Scenario: Successful login of user
        Given values in payload
            | field    | value              |
            | email    | eve.holt@reqres.in |
            | password | pistol             |
        When a request is sent to the login account endpoint
        Then request has a successful response of "200" status code
        And it should display login is successful

    @positive @delay
    Scenario: Successful login of user with delay
        Given values in payload
            | field    | value              |
            | email    | eve.holt@reqres.in |
            | password | pistol             |
        And additional delay of "3" seconds
        When a request is sent to the login account endpoint
        Then request has a successful response of "200" status code
        And it should display login is successful

    @negative
    Scenario: Unsuccessful login of account that does not exist
        Given values in payload
            | field    | value                   |
            | email    | csims@planittesting.com |
            | password | Password@123            |
        When a request is sent to the login account endpoint
        Then it should retun status code "400" with error message "user not found"

    @negative
    Scenario Outline: Unsuccessful login with incomplete fields
        Given values in payload
            | field   | value   |
            | <field> | <value> |
        When a request is sent to the login account endpoint
        Then it should retun status code "400" with error message "<message>"

        Examples: Missing email
            | field    | value  | message                   |
            | password | pistol | Missing email or username |

        Examples: Missing password
            | field | value              | message          |
            | email | eve.holt@reqres.in | Missing password |