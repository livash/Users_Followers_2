# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(:name => "olena", :username => "olena", :scrambled_password => "123olena")
user2 = User.create!(:name => "jon", :username => "jon", :scrambled_password => "123jon")
user3 = User.create!(:name => "ben", :username => "ben", :scrambled_password => "123ben")
user4 = User.create!(:name => "sam", :username => "sam", :scrambled_password => "123sam")

follow1 = Following.create!(:followed_user_id => 1, :follower_id => 2)
follow2 = Following.create!(:followed_user_id => 1, :follower_id => 3)
follow3 = Following.create!(:followed_user_id => 1, :follower_id => 4)

follow4 = Following.create!(:followed_user_id => 2, :follower_id => 1)
follow5 = Following.create!(:followed_user_id => 2, :follower_id => 3)
follow6 = Following.create!(:followed_user_id => 2, :follower_id => 4)

