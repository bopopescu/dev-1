DF = (2-1) * (3-1)
sig_level = 0.05

data = [[200,150,50],[250,300,50]]





def chi_score(data):
	E = [[0 for j in range(len(data[0]))] for i in range(len(data))]
	chi_squared = 0
	den = sum([sum(d) for d in data])

	for i in range(len(data)):
		d_i = sum(data[i])
		for j in range(len(data[i])):
			E[i][j] = (d_i * (data[0][j] + data[1][j]))/ den 

			chi_squared += (data[i][j] - E[i][j])**2 / E[i][j]
			
	return chi_squared

print(chi_score(data))
