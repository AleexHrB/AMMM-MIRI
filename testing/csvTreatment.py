import csv
import sys

file = sys.argv[1]
with open(file, newline='') as csvfile:

    spamreader = csv.DictReader(csvfile)
    print("a,b")
    for i,row in enumerate(spamreader):
        minutes = row['a'].split('m')[0]
        seconds = row['a'].split('m')[1].split('s')[0]
        res = 60* int(minutes) + float(seconds)
        print(f"{i+1},{res}")
        
   

##writefile = "test.csv"
##with open(file, "w", newline='') as csvfile:
##    spamwriter = csv.writer(csvfile, delimiter=' ',
##                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
##    spamwriter.writerow(['Spam'] * 4 + ['Baked Beans'])
##    spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])
