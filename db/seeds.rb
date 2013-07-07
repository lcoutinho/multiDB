# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.on_db(:users).delete_all
User.on_db(:users2).delete_all
User.on_db(:users3).delete_all
User.on_db(:users4).delete_all
User.on_db(:users5).delete_all

(0..5000).lazy.each do |f|
  puts 'Create user ' + f.to_s
  User.on_db(:users).create( :name => (0...20).map{(65+rand(26)).chr}.join)
end

(0..5000).lazy.each do |f|
  puts 'Create user ' + f.to_s
  User.on_db(:users2).create( :name => (0...20).map{(65+rand(26)).chr}.join)
end

(0..5000).lazy.each do |f|
  puts 'Create user ' + f.to_s
  User.on_db(:users3).create( :name => (0...20).map{(65+rand(26)).chr}.join)
end

(0..5000).lazy.each do |f|
  puts 'Create user ' + f.to_s
  User.on_db(:users4).create( :name => (0...20).map{(65+rand(26)).chr}.join)
end

(0..5000).lazy.each do |f|
  puts 'Create user ' + f.to_s
  User.on_db(:users5).create( :name => (0...20).map{(65+rand(26)).chr}.join)
end