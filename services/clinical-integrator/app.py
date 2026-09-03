import json, os, boto3
from flask import Flask, request, jsonify
app=Flask(__name__); eb=boto3.client("events")
@app.get("/healthz")
def health(): return {"status":"ok"}
@app.post("/events")
def events():
    body=request.get_json(force=True)
    eb.put_events(Entries=[{"Source":"careflow.clinical","DetailType":"FHIRClinicalEvent","Detail":json.dumps(body),"EventBusName":os.environ["EVENT_BUS_NAME"]}])
    return jsonify({"accepted":True}),202
if __name__=="__main__": app.run(host="0.0.0.0",port=8080)
