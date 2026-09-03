import json, os, time, boto3
sqs=boto3.client("sqs"); url=os.environ["QUEUE_URL"]
while True:
    r=sqs.receive_message(QueueUrl=url,MaxNumberOfMessages=10,WaitTimeSeconds=20,VisibilityTimeout=60)
    for m in r.get("Messages",[]):
        event=json.loads(m["Body"]); print(json.dumps({"processed":True,"event":event}))
        sqs.delete_message(QueueUrl=url,ReceiptHandle=m["ReceiptHandle"])
    time.sleep(1)
