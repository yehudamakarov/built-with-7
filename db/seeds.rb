# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


the_one = User.create(
  first_name: 'TheOne',
  last_name: 'TheOnly',
  email: 'yes@yes.com',
  skip_password_validation: true
)



the_one.days.create(name: 'sunday')
the_one.days.create(name: 'monday')
the_one.days.create(name: 'tuesday')
the_one.days.create(name: 'wednesday')
the_one.days.create(name: 'thursday')
the_one.days.create(name: 'friday')
the_one.days.create(name: 'saturday')

the_one.monday.accomplishments.create(
  title: 'Hugged Esther',
  effect: 'Loved my wife.',
  date_time: DateTime.now.days_ago(1)
)

accomplishment_1 = Accomplishment.create(
  title: 'Did Chitas',
  effect: 'Had a good connected energy for the rest of the night.',
  date_time: DateTime.now
)

accomplishment_1.days.push(the_one.monday, the_one.wednesday)
