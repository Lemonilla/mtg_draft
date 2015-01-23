import requests
import json
import sys

page=0
c=0
frf = json.loads(requests.get("https://api.deckbrew.com/mtg/cards?set=%s&page=0" % sys.argv[1]).text)
while frf <> []:

        # print json.dumps(frf,indent=1)
        for a in xrange(0,len(frf)):

                # get multiverse id for picture
                i = frf[a]['editions'][0]['multiverse_id']
                # get rarity
                r = frf[a]['editions'][0]['rarity']

                print i,
                print "/",
                print r
                c = c + 1
        page = page + 1
        frf = json.loads(requests.get("https://api.deckbrew.com/mtg/cards?set=frf&page=%d" % page).text)