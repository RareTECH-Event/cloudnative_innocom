import boto3, os


def initDynamoDB():
    dynamodb = boto3.client(
        "dynamodb",
        # endpoint_url=app.config["DB_ENDPOINT"],
        # region_name=app.config["AWS_REGION"],
        # aws_access_key_id=app.config["AWS_ACCESS_KEY_ID"],
        # aws_secret_access_key=app.config["AWS_SECRET_ACCESS_KEY"],
        # appを読み込むと循環参照になるため
        endpoint_url=os.environ["DB_ENDPOINT"],
        region_name=os.environ["AWS_REGION"],
        aws_access_key_id=os.environ["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key=os.environ["AWS_SECRET_ACCESS_KEY"],
    )
    return dynamodb
