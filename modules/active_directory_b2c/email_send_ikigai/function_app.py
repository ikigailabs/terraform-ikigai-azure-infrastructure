import re
import azure.functions as func
import datetime
import json
import logging
import requests

app = func.FunctionApp()

@app.route(route="email_send_trigger", auth_level=func.AuthLevel.ANONYMOUS)
def email_send_trigger(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    encoded_user_email = req.params.get('encoded_user_email')
    custom_field_extention = req.params.get('custom_field_extention')
    access_token = req.params.get('access_token')
    tenant = req.params.get('tenant')

    request_url = f"https://graph.microsoft.com/v1.0/users/{encoded_user_email}@{tenant}.onmicrosoft.com"
    req_params = {
        f"extension_{custom_field_extention}_email_verified": "true",
        f"extension_{custom_field_extention}_user_status": "CONFIRMED",
        f"accountEnabled": True
    }


    req_headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {access_token}",
    }

    requests.patch(
        request_url, json=req_params, headers=req_headers
    )

    return func.HttpResponse(
             "Your account has succesfully been confirmed with Ikigai!",
             status_code=200
    )
