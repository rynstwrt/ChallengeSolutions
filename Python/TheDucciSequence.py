#https://www.reddit.com/r/dailyprogrammer/comments/8sjcl0/20180620_challenge_364_intermediate_the_ducci/

history = []
def ducci(arr):
	history.append(arr)
	print arr
	new_array = []
	for i, v in enumerate(arr):
		arg = i + 1 if i < len(arr) - 1 else 0
		new_array.append(abs(v - arr[arg]))
	if new_array not in history:
		ducci(new_array)
	
ducci([0, 653, 1854, 4063])
