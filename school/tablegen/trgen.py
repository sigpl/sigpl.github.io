import sys
import subprocess

filename = sys.argv[1]

f = open (filename, 'r')

n = int(f.readline())
print "n=" + str(n)

td_template = "<td bgcolor=\"white\"> %s </td>"

for l in f.readlines():
    items = l.split('|')

    cur_line = "<tr>"

    for i in range(n):
        cur_line += td_template % items[1 + i]

    cur_line += "</tr>"

    print cur_line
