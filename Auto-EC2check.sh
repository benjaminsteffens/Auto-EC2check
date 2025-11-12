#!/bin/bash

INSTANCE_ID="i-04a4765fbacb8f06a"
REGION="us-east-1"

# This command retrieves the current state name (e.g., 'running', 'stopped')
STATUS=$(aws ec2 describe-instances \
    --instance-ids $INSTANCE_ID \
    --query 'Reservations[0].Instances[0].State.Name' \
    --output text 2>/dev/null) 

echo "Checking status of instance $INSTANCE_ID..."
echo "Current Status: $STATUS"


if [ "$STATUS" = "running" ]; then
    echo "Status 200OK. Your EC2 instance is **$STATUS**."
    
elif [ "$STATUS" = "stopped" ] || [ "$STATUS" = "pending" ]; then
    echo "Your EC2 instance is **$STATUS**. Starting instance..."
        aws ec2 start-instances --instance-ids $INSTANCE_ID
    echo "Instance start command sent."

else
    echo "Unexpected status or instance not found: **$STATUS**"
    echo "No action taken."
fi