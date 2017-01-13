import json, csv
from datetime import datetime

users = {}

with open('project-8035943003290177832-KBSets-export.json') as kb_json_data:
	d = json.load(kb_json_data)
	for i in d:

		user = d[i]["user"]
		date = d[i]["date"]
		if user in users:
			tup = users[user]
			tup[0] = min(tup[0], date)
			tup[1] = max(tup[1], date)
			users[user] = tup
		else:
			users[user] = [date,date]

print(users)

with open('users.csv','w') as csvfile:
	csv_writer = csv.writer(csvfile)
	csv_writer.writerow(['Username','Start Date', 'End Date'])
	for user in users:
		csv_writer.writerow([user,datetime.fromtimestamp(users[user][0]).date(),datetime.fromtimestamp(users[user][1]).date()])