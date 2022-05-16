Feature: User Creation in Reqres

    As a User, I want to be able to create user in Reqres
    So that I will be able to add user and details in the site

    @positive
    Scenario: Successful creation of new user
        Given values in payload
            | field | value    |
            | name  | zee      |
            | job   | magician |
        When a request is sent to the create new user endpoint
        Then request has a successful response of "201" status code
        And it should display successful creation of user


    @positive
    Scenario: Successful creation of new user with additonal details
        Given values in payload
            | field    | value    |
            | name     | zee      |
            | job      | magician |
            | location | 12 ave   |
            | color    | blue     |
        When a request is sent to the create new user endpoint
        Then request has a successful response of "201" status code
        And it should display successful creation of user
        

    @positive
    Scenario: Successful creation of new user only name provided
        Given values in payload
            | field    | value    |
            | name     | zee      |
        When a request is sent to the create new user endpoint
        Then request has a successful response of "201" status code
        And it should display successful creation of user