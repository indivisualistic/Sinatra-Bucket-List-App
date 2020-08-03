#here is where I will create some seed data and test associations by creating users and data entry. 


#create 2 users

carlos = User.create(name: "Carlos", email: "carlos@carlos.com", password: "password")
neivy = User.create(name: "Neivy", email: "neivy@neivy.com", password: "password")

#Create bucket List Destinations

BucketFiller.create(bucket_list: "I would love to fly to the Maldives!", user_id: carlos.id)

#Use AR to connect previous data

carlos.bucket_fillers.create(bucket_list: "We are creating your personal Sinatra Bucket List App!")

neivys_entry = neivy.bucket_fillers.build(bucket_list: "I got my hair did!")