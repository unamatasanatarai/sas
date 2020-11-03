import urllib.request
import gzip
import json

api_url="https://api.stackexchange.com/2.2"

def search(args):
    req = urllib.request.urlopen(
        url("/search/advanced", args)
    )
    content = req.read()
    if req.info().get('Content-Encoding') == 'gzip':
        content = gzip.decompress(content)

    return json.loads(content)

def url(endpoint, params = {}):
    params = urllib.parse.urlencode(params)
    return api_url + endpoint + "?" + params
