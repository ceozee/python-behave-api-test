Feature: Register new user account in Reqres

    As a non registered user, I want to be able to register an account in Reqres
    So that I will be able to have an account in the Scenario Outline: 
    
    @positive
    Scenario: Successful register account
        Given values in payload
            | field    | value              |
            | email    | eve.holt@reqres.in |
            | password | pistol             |
        When a request is sent to the register account endpoint
        Then request has a successful response of "200" status code
        And it should display registration is successful


    @negative
    Scenario: Unsuccessful registration of account using undefined user
        Given values in payload
            | field    | value                   |
            | email    | csims@planittesting.com |
            | password | Password@123            |
        When a request is sent to the register account endpoint
        Then it should retun status code "400" with error message "Note: Only defined users succeed registration"


    @negative
    Scenario Outline: Unsuccessful registration with incomplete fields
        Given values in payload
            | field   | value   |
            | <field> | <value> |
        When a request is sent to the register account endpoint
        Then it should retun status code "400" with error message "<message>"

        Examples: Missing email
            | field    | value  | message                   |
            | password | pistol | Missing email or username |

        Examples: Missing password
            | field | value              | message          |
            | email | eve.holt@reqres.in | Missing password |