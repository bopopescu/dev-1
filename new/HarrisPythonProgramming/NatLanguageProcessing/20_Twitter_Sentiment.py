import sentiment_mod as s
from tweepy import Stream, OAuthHandler
from tweepy.streaming import StreamListener
import json, time

ckey = '0qG7te0iCZb81mIw0zT7cInIp'
csecret = 'IVdhAoSl7vqcIx7FBkb9wGYzjrBpic8ihBU7y1AuxtSAESU0gA'
atoken = '412705000-ADLy2QVyOimc0nrBxFbFEqMUQitBSHioHKm7oEAW'
asecret = 'AgXvOMeSnKLiFBMHgUPrrDv0j1luJGiGU3zzyfdvx2vGc'

class listener(StreamListener):

    def on_data(self,data):
        try:
            all_data = json.loads(data)
            tweet = all_data['text']


            sentiment_value, confidence = s.sentiment(tweet)
            print(tweet, sentiment_value, confidence*100)
            if confidence*100 >= 80:
                output = open('twitter-out.txt', 'a')
                output.write(sentiment_value)
                output.write('\n')
                output.close()
            time.sleep(0.25)
            return True
        except BaseException:
            print('failed ondata')
            time.sleep(5)
    def on_error(self, status):
        print(status)


auth = OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)

twitterStream = Stream(auth, listener())

twitterStream.filter(track=['obama'])