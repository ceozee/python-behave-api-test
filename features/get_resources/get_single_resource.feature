Feature: Get Single resource in Reqres by id

    As a User, I want to be able to get a resource using id
    So that I can identify specific resource if needed

    @positive
    Scenario: Successful get existing users
        Given id provided is "1"
        When request is sent to the get resource endpoint
        Then request has a successful response of "200" status code
        And it should display complete details
            | data_field    |
            | id            |
            | name          |
            | year          |
            | color         |
            | pantone_value |


    @negative
    Scenario Outline: Unsuccessful get user using user_id that does not exist or invalid
        Given id provided is "<resource_id>"
        When request is sent to the get resource endpoint
        Then it should respond with error status code with id does not exist

        Examples:
            | resource_id |
            | 99999       |
            | one         |
            | 0n3#        |
            | !@#         |

