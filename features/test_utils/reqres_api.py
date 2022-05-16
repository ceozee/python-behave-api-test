from configparser import ConfigParser
from requests import api

class ReqresApi:
    def __init__(self):
        config = ConfigParser()
        config.read('behave.ini')
        env = config._sections['profile']['env']
        config_env = config._sections[env]
        URL = config_env['url']
        self.reqres_api = f'{URL}/api'

    def create_user(self, headers, params, payload):
        return api.request(method='POST', url=f'{self.reqres_api}/users', 
                            headers=headers, json=payload, params=params)

    def get_single_user(self, headers, params, user_id):
        return api.request(method='GET', url=f'{self.reqres_api}/users/{user_id}', 
                            headers=headers, params=params)

    def get_user_list(self, headers, params):
        return api.request(method='GET', url=f'{self.reqres_api}/users', 
                            headers=headers, params=params)

    def update_user(self, headers, params, payload, user_id):
        return api.request(method='PUT', url=f'{self.reqres_api}/users/{user_id}', 
                            headers=headers, json=payload, params=params)

    def partial_update_user(self, headers, params, payload, user_id):
        return api.request(method='PATCH', url=f'{self.reqres_api}/users/{user_id}', 
                            headers=headers, json=payload, params=params)

    def register_account(self, headers, params, payload):
        return api.request(method='POST', url=f'{self.reqres_api}/register', 
                            headers=headers, json=payload, params=params)

    def login_account(self, headers, params, payload):
        return api.request(method='POST', url=f'{self.reqres_api}/login', 
                            headers=headers, json=payload, params=params)

    def get_single_resource(self, headers, params, resource_id):
        return api.request(method='GET', url=f'{self.reqres_api}/unknown/{resource_id}', 
                            headers=headers, params=params)

    def get_resource_list(self, headers, params):
        return api.request(method='GET', url=f'{self.reqres_api}/unknown', 
                            headers=headers, params=params)

    def delete_user(self, headers, params, user_id):
        return api.request(method='DELETE', url=f'{self.reqres_api}/users/{user_id}', 
                            headers=headers, params=params)
