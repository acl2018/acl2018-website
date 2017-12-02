import csv

tsv_reader = lambda f: csv.DictReader(f, dialect=None, delimiter='\t', quoting=csv.QUOTE_NONE)
for d in tsv_reader(open("workshops.tsv")):
    print "* [%s](%s)" % (d['Title'], d['WorkshopURL'])

# better to use yaml with the jekyll templating system?
# import yaml
# print yaml.dump(list(tsv_reader(open("workshops.tsv"))))
