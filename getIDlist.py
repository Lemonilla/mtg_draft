import requests
import json
import sys

setlist = json.loads(requests.get("http://api.deckbrew.com/mtg/sets").text)

f = open(sys.argv[1],'w')

x=0
for x in xrange(1,len(setlist)):
        pr = setlist[x]['id'].encode('utf-8') + " : " + setlist[x]['name'].encode('utf-8') + "\n"
        #print pr
        f.write(pr)
        x = x + 1

f.close()
