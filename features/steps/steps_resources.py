from behave import when


@when('a request is sent to the get list of resources endpoint')
def step_impl(context):
    context.response = context.reqres_api.get_resource_list(headers=context.headers, 
                                                                params=context.params)


@when('request is sent to the get resource endpoint')
def step_impl(context):
    context.response = context.reqres_api.get_single_resource(headers=context.headers, 
                                                                params=context.params, 
                                                                resource_id=context.id)