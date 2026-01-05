import json
import boto3
import uuid

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('items-table')

def lambda_handler(event, context):
    body = json.loads(event['body'])
    item_id = str(uuid.uuid4())

    table.put_item(
        Item={
            'id': item_id,
            'name': body['name']
        }
    )

    return {
        'statusCode': 201,
        'body': json.dumps({'id': item_id})
    }
