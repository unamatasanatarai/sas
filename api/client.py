import urllib.request
url="https://api.stackexchange.com/2.2"
def search(args):
    params = urllib.parse.urlencode(args)
    req = urllib.request.Request(url=url);
    res = urllib.request.urlopen(req, params)
    return res.read()
