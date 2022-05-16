from behave import when, then
from assertpy import assert_that


@when('a request is sent to the register account endpoint')
def step_impl(context):
    context.response = context.reqres_api.register_account(headers=context.headers, 
                                                            params=context.params, 
                                                            payload=context.payload)


@then('it should display registration is successful')
def step_impl(context):
    json_response = context.response.json()
    assert_that(json_response).contains('id', 'token').is_not_empty()


@when('a request is sent to the login account endpoint')
def step_impl(context):
    context.response = context.reqres_api.login_account(headers=context.headers, 
                                                            params=context.params, 
                                                            payload=context.payload)

@then('it should display login is successful')
def step_impl(context):
    json_response = context.response.json()
    assert_that(json_response).contains('token').is_not_empty()
