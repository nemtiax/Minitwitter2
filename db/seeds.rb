# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create([{name: 'Alice', email: 'alice@example.com', image_url: 'alice.png', password: 'password'}, {name: 'Bob', email: 'bob@example.com', image_url: 'bob.jpg', password: 'password'}, {name: 'Carol', email: 'carol@example.com', image_url: 'carol.jpg', password: 'password'}])

alice = User.where(name: 'Alice').take
bob = User.where(name: 'Bob').take
carol = User.where(name: 'Carol').take

Tweet.destroy_all
Tweet.create([{body: "This is a tweet that Alice wrote", user_id: alice.id},
{body: "This is another tweet that Alice wrote", user_id: alice.id},
{body: "This is a tweet that Bob wrote", user_id: bob.id}, {body: "This is another tweet that Bob wrote", user_id: bob.id}])

FollowerConnection.destroy_all
FollowerConnection.create([{:follower => alice, :followee => bob}, {follower: alice, followee: carol}, {follower: bob, followee: alice}, {follower: carol, followee: bob}])
