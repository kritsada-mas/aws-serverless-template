import json

def lambda_handler(event, context):    
    body = event.get('params', None).get('querystring', None)
    headers = event.get('params', None).get('header', None)
    
    return {
        'statusCode': 201,
        'headers': json.dumps(headers),
        'body': json.dumps(body)
    }
        