import csv

rows = []

with open('data\Artist Database (outdated 2014-2017) - Artists.csv', mode='r', encoding="utf8", errors='ignore') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',', dialect='excel')
    line_count = 0
    for row in csv_reader:
        rows.append(row)
        line_count += 1
    # print(line_count)
    # print(len(rows))

# for key in list(rows[0].keys()):
#     print(key)
#
# for row in rows:
#     for val in list(row.values()):
#         print(val)

Genres = set([])

for row in rows:
    # print([row[k] for k in row])
    log = row['Genre(s)'].split('/')
    print(log)
