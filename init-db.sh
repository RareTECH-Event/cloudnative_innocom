#!/bin/sh
# This script initializes the DynamoDB tables.

set -e

echo "Waiting for DynamoDB to be ready..."
sleep 10

echo "Creating tables..."
for f in /dynamoDB/schema/*.json; do
  echo "Creating table from $f"
  aws dynamodb create-table --cli-input-json file://"$f" --endpoint-url http://dynamodb:8000
done

echo "Setting TTL for sessions table..."
aws dynamodb update-time-to-live --table-name sessions --time-to-live-specification '{"Enabled":true,"AttributeName":"expired_at"}' --endpoint-url http://dynamodb:8000

echo "Database initialization complete."
