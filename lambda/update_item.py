import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('items-table')

def lambda_handler(event, context):
    item_id = event['pathParameters']['id']
    body = json.loads(event['body'])

    table.update_item(
        Key={'id': item_id},
        UpdateExpression="SET #n = :name",
        ExpressionAttributeNames={"#n": "name"},
        ExpressionAttributeValues={":name": body['name']}
    )

    return {
        'statusCode': 200,
        'body': json.dumps({'message': 'Updated'})
    }
