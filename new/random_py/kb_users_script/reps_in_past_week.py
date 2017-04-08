import json, csv
from datetime import datetime

users = {}

with open('project-8035943003290177832-KBSets-export.json') as kb_json_data:
	d = json.load(kb_json_data)
	for i in d:

		user = d[i]["user"]
		date = d[i]["date"]

		if "KBExercises" not in d[i] or date <= 1487358000:
			continue
		exercises = d[i]["KBExercises"]
		reps = 0
		for exercise in exercises:
			
			reps += exercises[exercise]["reps"]

		


		print(reps)

		users.setdefault(user, 0)
		users[user] += reps

users = sorted(list(users.items()), key=lambda x: -x[1])
print(users)

with open('rep_leaders.csv','w') as csvfile:
	csv_writer = csv.writer(csvfile)
	csv_writer.writerow(['Username','Total Reps'])
	for user, total_reps in users:
		csv_writer.writerow([user, total_reps])