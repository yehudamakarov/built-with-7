Habit Builder
=============

Use the structure of a week as a task scheduler to form and reinforce habits.

### System Dependencies

Developed using Rails 5.2\.

### Description

A habit tracker.

Users can log in and sign up using Google and/or Github.

If you realize that you do something that you would like to build as some form of habit, enter in what you accomplished, and this will now be on your week.

The only form of calendar available is a week. If you did something on a Sunday, you will at least be prompted to repeat the accomplishment every Sunday.

If you’d like to accomplish things more frequently, tasks can be performed at multiple times throughout the week.

You enter accomplishments that you feel/felt good about achieving, and then you can view these in a weekly scope. You can slowly add to the frequency of a given accomplishment. And also keep notes handy about them. This helps to remember the positive outcomes and experience of a given task when it is time to do something again.

Users can log in and have their own week, as well as see other user's weeks.

### Installation

Fork this project, clone it down to a folder you'd like to have it in. Navigate to the folder in your terminal of choice and run `bundle install``​`​. You should probably run a `rake db:migrate`. Then you can `rails start` on your localhost and use the web app.

If you would like to seed the database with a bunch of imaginary data so you can get a feel for the interface, after `bundle install` you can run `rake db:drop db:create db:migrate db:create`. Check the seeds.rb file first.

### Contribute

Please feel free to contribute. Just open a pull request. If something is wrong or doesn't work, see if you can figure out why. If you can't, reach out to me or file an issue on Github. \<3.

Bug reports and pull requests are welcome on GitHub at [https://github.com/yehudamakarov/habit-builder](https://github.com/yehudamakarov/inspiration-please.).

### License

This product is registered under the MIT License - Copyright (c) 2018 Yehuda (Nikita) Makarov. See `./LICENSE`.