import os
import operator

target_dir = os.path.dirname(os.path.realpath(__file__)) + '/../content/stack'

all_tags = {}
count = 0

for path, dirs, files in os.walk(target_dir):
  for f in files:
    filename = "%s/%s" % (path, f)
    with open(filename, 'r') as r:
      for line in r:
        if line[0:4] == '### ':
          count += 1
          tags = line[4:].split("/")
          tags = map(lambda x: x.strip(), tags)
          for tag in tags:
            if tag in all_tags:
              all_tags[tag] += 1
            else:
              all_tags[tag] = 1

print count
#print "---------"
#s = sorted(all_tags.items(), key=lambda x: x[1])
#for (k,v) in s:
#  print v,k
print "---------"
s = sorted(all_tags.items(), key=lambda x: x[0])
for (k,v) in s:
  print v,k
