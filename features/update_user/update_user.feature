Feature: Update user details in Reqres

    As a user, I want to be able to update user in Reqres
    So that I will be able to update user details that needs to be changed

    @positive
    Scenario: Successful update user partial details
        Given values in payload
            | field | value  |
            | job   | knight |
        And id provided is "201"
        When request is sent to update part of user
        Then request has a successful response of "200" status code
        And it should display successful update of user


    @positive
    Scenario: Successful update user full details
        Given values in payload
            | field | value   |
            | name  | see     |
            | job   | plumber |
        And id provided is "101"
        When request is sent to full update of user
        Then request has a successful response of "200" status code
        And it should display successful update of user
