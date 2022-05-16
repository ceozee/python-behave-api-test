from behave import step, given, then
from assertpy import assert_that


@step('page parameter is "{page}"')
def step_impl(context, page):
    context.params['page'] = int(page)


@step('additional delay of "{delay}" seconds')
def step_impl(context, delay):
    context.params['delay'] = int(delay)

@given('id provided is "{input_id}"')
def step_impl(context, input_id):
    context.id = input_id


@given('values in payload')
def step_impl(context):
    context.payload = {}
    for row in context.table:
        context.payload[row['field']] = row['value']


@then('request has a successful response of "{response_code}" status code')
def step_impl(context, response_code):
    assert_that(context.response.status_code).is_equal_to(int(response_code))

@then('it should display that result list matches page and total')
def step_impl(context):
    json_response = context.response.json()
    assert_that(json_response['page']).is_equal_to(context.params['page'])
    assert_that(json_response['per_page']).is_equal_to(len(json_response['data']))


@then('retrieved data is complete')
def step_impl(context):
    json_response = context.response.json()
    response_data_list = json_response['data']
    for data_list in response_data_list:
        for row in context.table: 
            assert_that(data_list).contains(row['data_field'])
        for field in data_list:
            assert_that(field).is_not_empty()


@then('retrieved list is empty')
def step_impl(context):
    json_response = context.response.json()
    assert_that(json_response['data']).is_empty()


@then('it should display complete details')
def step_impl(context):
    json_response = context.response.json()
    response_data_list = json_response['data']

    for row in context.table: 
        assert_that(response_data_list).contains(row['data_field'])

    assert_that(context.id).is_equal_to(f"{response_data_list['id']}")
    for field in response_data_list: assert_that(field).is_not_empty()


@then('it should respond with error status code with id does not exist')
def step_impl(context):
    assert_that(context.response.status_code).is_equal_to(404)
    json_response = context.response.json()
    assert_that(json_response).is_empty


@then('it should retun status code "{status_code}" with error message "{message}"')
def step_impl(context, message, status_code):
    assert_that(context.response.status_code).is_equal_to(int(status_code))
    json_response = context.response.json()
    assert_that(json_response['error']).is_equal_to(message)