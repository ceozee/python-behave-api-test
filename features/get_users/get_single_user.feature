Feature: Get Single user in Reqres by id

    As a User, I want to be able to get a user using user id
    So that I can identify specific user if needed

    @positive
    Scenario: Successful get existing users
        Given id provided is "1"
        When a request is send to the get user endpoint
        Then request has a successful response of "200" status code
        And it should display complete details
            | data_field |
            | id         |
            | email      |
            | first_name |
            | last_name  |
            | avatar     |


    @negative
    Scenario Outline: Unsuccessful get user using user_id that does not exist or invalid
        Given id provided is "<user_id>"
        When a request is send to the get user endpoint
        Then it should respond with error status code with id does not exist

        Examples:
            | user_id |
            | 99999   |
            | one     |
            | 0n3#    |
            | !@#     |
