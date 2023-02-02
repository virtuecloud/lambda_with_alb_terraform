update the following code on hello-python.py file for seamless performance




-------------------------------------------------------
import json

def lambda_handler(event, context):
    # TODO implement
    return {
        "headers": {
            "Content-Type": "json; charset=utf-8"
            },
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }



---------------------------------------------------------
