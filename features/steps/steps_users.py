from behave import when, then
from assertpy import assert_that


@when('a request is send to the get list of users endpoint')
def step_impl(context):
    context.response = context.reqres_api.get_user_list(headers=context.headers, 
                                                        params=context.params)


@when('a request is send to the get user endpoint')
def step_impl(context):
    context.response = context.reqres_api.get_single_user(headers=context.headers, 
                                                            params=context.params, 
                                                            user_id=context.id)


@when('a request is sent to the create new user endpoint')
def step_impl(context):
    context.response = context.reqres_api.create_user(headers=context.headers, 
                                                        params=context.params, 
                                                        payload=context.payload)


@then('it should display successful creation of user')
def step_impl(context):
    json_response = context.response.json()
    assert_that(context.payload).is_subset_of(json_response)
    assert_that(json_response).contains('id', 'createdAt').is_not_empty()


@when('request is sent to update part of user')
def step_impl(context):
    context.response = context.reqres_api.partial_update_user(headers=context.headers, 
                                                                params=context.params, 
                                                                payload=context.payload, 
                                                                user_id=context.id)


@when('request is sent to full update of user')
def step_impl(context):
    context.response = context.reqres_api.update_user(headers=context.headers, 
                                                        params=context.params, 
                                                        payload=context.payload, 
                                                        user_id=context.id)


@then('it should display successful update of user')
def step_impl(context):
    json_response = context.response.json()
    assert_that(context.payload).is_subset_of(json_response)
    assert_that(json_response).contains('updatedAt').is_not_empty()


@when('a request is sent to the delete user endpoint')
def step_impl(context):
    headers = context.headers
    params = context.params
    context.response = context.reqres_api.delete_user(headers=context.headers, 
                                                    params=context.params, 
                                                    user_id=context.id)