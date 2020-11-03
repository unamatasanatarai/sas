#!/usr/bin/env python3
from cli import client as cli_client
from api import client as api_client
import json

def format_menu(i):
    return {
        "title":i["title"],
        "score":i["score"],
        "link":i["link"]
    }

# results = api_client.search(cli_client.run())
# print(json.dumps(results))
# exit()

with open("example.json") as f:
    results = f.read()

results = json.loads(results)
menu = [ format_menu(i) for i in results["items"] ]
print(menu)
