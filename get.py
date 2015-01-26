# get.py <set> <#packs> <%cd%>

import requests
import random
import json
import sys

page=0
c=0
rares = []
uncommons = []
commons = []
se = json.loads(requests.get("https://api.deckbrew.com/mtg/cards?set=%s&page=0" % sys.argv[1]).text)
frf = se
while frf <> []:

        # print json.dumps(frf,indent=1)
        for a in xrange(0,len(frf)):

                # get multiverse id for picture
                i = frf[a]['editions'][0]['multiverse_id']
                # get rarity
                r = frf[a]['editions'][0]['rarity']
                
                if r == "rare" or r == "mythic":
                        rares.append(c)
                if r == "uncommon":
                        uncommons.append(c)
                if r == "common":
                        commons.append(c)
                
            #    print i,
            #    print "/",
             #   print r
                c = c + 1
        page = page + 1
        frf = json.loads(requests.get("https://api.deckbrew.com/mtg/cards?set=frf&page=%d" % page).text)
        se = se + frf

a=0
for x in xrange(0,int(sys.argv[2])):
        a=a+1
        pack=[rares[int(random.random()*len(rares))],uncommons[int(random.random()*len(uncommons))],uncommons[int(random.random()*len(uncommons))],uncommons[int(random.random()*len(uncommons))]]
        for x in xrange(10):
                pack.append(commons[int(random.random()*len(commons))])
        print a,
        print pack
        pac = open(sys.argv[3]+"\pack"+str(a)+".txt",'w')
        for f in pack:
                pac.write(str(se[f]['editions'][0]['multiverse_id']))
                pac.write("\n")
        pac.close()