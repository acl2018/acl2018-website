import csv

tsv_reader = lambda f: csv.DictReader(f, dialect=None, delimiter='\t', quoting=csv.QUOTE_NONE)

import json
with open("_data/workshops.json", "w") as f:
    json.dump(list(tsv_reader(open("_raw_data/workshops.tsv"))), fp=f)
