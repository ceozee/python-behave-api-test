from test_utils.reqres_api import ReqresApi

def before_all(context):
    context.reqres_api = ReqresApi()
    

def before_scenario(context, scenario):
    context.headers = {}
    context.params = {}