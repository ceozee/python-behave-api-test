Feature: Get Users list in Reqres

    As a User, I want to be able to get all users
    So that I can see all existing users and details in Reqres

    @positive
    Scenario: Successful get list of users
        Given page parameter is "1"
        When a request is send to the get list of users endpoint
        Then request has a successful response of "200" status code
        And it should display that result list matches page and total
        And retrieved data is complete
            | data_field |
            | id         |
            | email      |
            | first_name |
            | last_name  |
            | avatar     |

    @positive
    Scenario: Successful get list of users with page more than total
        Given page parameter is "300"
        When a request is send to the get list of users endpoint
        Then request has a successful response of "200" status code
        And retrieved list is empty

    @positive @delayed
    Scenario: Successful get list of users with delay
        Given page parameter is "1"
        And additional delay of "5" seconds
        When a request is send to the get list of users endpoint
        Then request has a successful response of "200" status code
        And it should display that result list matches page and total
        And retrieved data is complete
            | data_field |
            | id         |
            | email      |
            | first_name |
            | last_name  |
            | avatar     |