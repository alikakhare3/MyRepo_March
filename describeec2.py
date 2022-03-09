import json
import boto3
client = boto3.client('ec2',region_name="us-west-1")
Myec2=client.describe_instances()
tags=input('enter the tag Name : ')



for reservation in Myec2['Reservations']:
    for instance in reservation['Instances']:
        for tag in instance['Tags']:
            if tag['Key'] == 'Name':
                consoleName = tag['Value']
                if consoleName == tags:
                   print(instance)