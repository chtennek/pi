Twitter = require 'twitter'

api_key = 'E2c5LEOj5hkzpSacLSaMUFbGw'
api_secret = 'RBByVkB6ZCbfd8fgn45fSK8rWAw1Ak6LJsHfGcwGqIvKyu5wwB'
user_token = '279057181-noZ53SnbcKXZFbPSB7mKWJE0S1E2NWHhZUHnOlrC'
user_secret = '8T8gLqKeQyCepe0dAfTWblMAsmjfT6Kx6gMgiaBWzMjjB'
client = new Twitter consumer_key: api_key, consumer_secret: api_secret, access_token_key: user_token, access_token_secret: user_secret

inputs = [
	[34637, 'realDonaldTrump']
	[354, 'potus']
	[527, 'vp']
]

for [baseline, user] in inputs
	do (baseline, user) ->
		client.get 'users/show', { screen_name: user }, (err, tweets, resp) ->
			if err
				console.log err
				return
			console.log tweets['statuses_count'] - baseline, baseline, user
