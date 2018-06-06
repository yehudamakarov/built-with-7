# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_json = open('./MOCK_DATA.json').read
users_array = JSON.parse(users_json)

users_array.each do |e|
  u = User.new(e)
  u.days.build(name: 'Sunday')
  u.days.build(name: 'Monday')
  u.days.build(name: 'Tuesday')
  u.days.build(name: 'Wednesday')
  u.days.build(name: 'Thursday')
  u.days.build(name: 'Friday')
  u.days.build(name: 'Saturday')
  u.skip_password_validation = true
  u.save
end

tasks_json = open('./MOCK_DATA_1.json').read

tasks_array = JSON.parse(tasks_json)

tasks_array.each do |t|
  a = Accomplishment.new(t)
  a.user.days.sample(3).each do |d|
    d.accomplishments << a
  end
  a.save
end
