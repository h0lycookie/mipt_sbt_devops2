import json
import os
import typing as tp
from fastapi import FastAPI, Request

with open('/app/logs/app.log', 'w') as f:
    f.write(json.dumps({'logs': 'begin'}) + '\n')

app = FastAPI()

@app.get("/")
async def root():
    return 'Welcome to the custom app'


@app.get("/status")
async def get_status():
    return {"status": "ok"}


@app.post("/log")
async def post_logs(request: Request):
    json_text = await request.json()
    with open('/app/logs/app.log', 'a') as f:
        f.write(json.dumps(json_text) + '\n')    


@app.get("/logs")
async def get_logs():
    with open('/app/logs/app.log', 'r') as f:
        return list(map(json.loads, f))