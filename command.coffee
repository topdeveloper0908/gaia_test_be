https://heartcloud.com/oauth/authorize?response_type=code&client_id=gaia.t62stc3k899w2b4a3k5&scope=profile%20settings%20activity&state=i9z4d4315fFtoiuK7wP2b3A3b8npZv

curl -i -H 'Authorization: Basic Z2FpYS50NjJzdGMzazg5OXcyYjRhM2s1OnNGWUVIZjQ3NDZGSjM4MzRoQlpkc2RrcWZoMjNrRWZIZA==' -H 'Content-Type: application/x-www-form-urlencoded' -X POST --data-urlencode 'grant_type=authorization_code' --data-urlencode 'code=f4bc6f1d7733c80789f18304400b7b3d8c6bb493' https://heartcloud.com/oauth/token


curl -i -H "Accept: application/json" -X POST -d "{\"k\":\"3e9284fk91ta7u84k3ua96fbes21v4kb\",\"t\":\"647aa2c90229c72cfc84fc9e61296823f04115a0\",\"d\":20201225}" https://api.heartcloud.com/api/v1/me/day/


curl -Uri "https://api.heartcloud.com/api/v1/me/day/" -Method Post -Headers @{"Accept" = "application/json"; "Content-Type" = "application/json"} -Body '{"k":"3e9284fk91ta7u84k3ua96fbes21v4kb","t":"647aa2c90229c72cfc84fc9e61296823f04115a0","d":20240228}'

curl -Uri "https://api.heartcloud.com/api/v1/me/data/" -Method Post -Headers @{"Accept" = "application/json"; "Content-Type" = "application/json"} -Body '{"k":"3e9284fk91ta7u84k3ua96fbes21v4kb","t":"647aa2c90229c72cfc84fc9e61296823f04115a0","From":1420070401,"To":1432512001}'

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"k":"3e9284fk91ta7u84k3ua96fbes21v4kb","t":"53421083369146328faac4935e08006f7f8b5e12","From":1420070401,"To":1432512001}' https://api.heartcloud.com/api/v1/me/data/
