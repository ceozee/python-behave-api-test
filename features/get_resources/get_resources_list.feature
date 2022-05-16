Feature: Get resources list in Reqres

    As A User, I want to be able to get all resources
    So that I will be able to see and use the resource needed

    @positive
    Scenario: Successful get list of resoures
        Given page parameter is "1"
        When a request is sent to the get list of resources endpoint
        Then request has a successful response of "200" status code
        And it should display that result list matches page and total
        And retrieved data is complete
            | data_field    |
            | id            |
            | name          |
            | year          |
            | color         |
            | pantone_value |


    @positive
    Scenario: Successful get list of resources with page more than total
        Given page parameter is "300"
        When a request is sent to the get list of resources endpoint
        Then request has a successful response of "200" status code
        And retrieved list is empty

    

