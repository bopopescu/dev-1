DF = (2-1) * (3-1)
sig_level = 0.05

data = [[200,150,50],[250,300,50]]

E = [[0 for j in range(len(data[0]))] for i in range(len(data))]


chi_squared = 0
for i in range(len(data)):
	for j in range(len(data[i])):
		E[i][j] = (sum(data[i]) * (data[0][j] + data[1][j]))/ 1000
		chi_squared += (data[i][j] - E[i][j])**2 / E[i][j]

print(chi_squared)