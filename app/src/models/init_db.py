import boto3, os


def initDynamoDB():
    dynamodb = boto3.client(
        "dynamodb",
        # appを読み込むと循環参照になるため
        endpoint_url=os.environ.get("DB_ENDPOINT"),
        region_name=os.environ.get("AWS_REGION"),
        aws_access_key_id=os.environ.get("AWS_ACCESS_KEY_ID"),
        aws_secret_access_key=os.environ.get("AWS_SECRET_ACCESS_KEY"),
    )
    return dynamodb
