Feature: User Deletion in Reqres

    As a User, I want to be able to delete user by user ID
    So that I can remove user in Reqres

    @positive
    Scenario: Successful deletion of existing user
        Given id provided is "501"
        When a request is sent to the delete user endpoint
        Then request has a successful response of "204" status code