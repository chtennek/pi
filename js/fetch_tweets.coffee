cb = new Codebird
cb.setConsumerKey("E2c5LEOj5hkzpSacLSaMUFbGw", "RBByVkB6ZCbfd8fgn45fSK8rWAw1Ak6LJsHfGcwGqIvKyu5wwB")
cb.setToken("279057181-noZ53SnbcKXZFbPSB7mKWJE0S1E2NWHhZUHnOlrC", "8T8gLqKeQyCepe0dAfTWblMAsmjfT6Kx6gMgiaBWzMjjB")

inputs = [
	[34637, 'realDonaldTrump']
	[354, 'potus']
	[527, 'vp']
]

for [baseline, user] in inputs
	do (baseline, user) ->
		cb.__call 'users/show', { screen_name: user }, (reply, rate, err) ->
			if err
				console.log err
				return
			console.log reply['statuses_count'] - baseline, baseline, user
			$('#' + user).text (reply['statuses_count'] - baseline) + ' ' + user
