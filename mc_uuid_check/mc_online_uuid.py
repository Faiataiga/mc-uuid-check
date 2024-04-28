# Import Section
import sys
import json
import requests
# --------------


def get_uuid_api(username):
    api_url_base = 'https://api.mojang.com/users/profiles/minecraft/' + username
    response = requests.get(f"{api_url_base}")
    if response.status_code == 404:
        return "Username is not registered, its free or Input is Illegal"
        exit(1)
    else:
        uuid = json.dumps(response.json())
        uuid_hyphen = uuid[:16] + '-' + uuid[16:20] + '-' + uuid[20:24] + '-' + uuid[24:28] + '-' + uuid[28:]
        return uuid_hyphen
        #return json.dumps(response.json())

