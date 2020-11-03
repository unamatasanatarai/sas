#!/usr/bin/env python3
from cli import client as cli_client
from api import client as api_client

print(api_client.search(cli_client.run()))
