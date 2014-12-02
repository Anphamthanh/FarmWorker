# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'admin', first_name: 'First', last_name: 'Admin', password: 'password', password_confirmation: 'password', email: 'admin@localhost.com', role: "Admin")
User.create(username: 'student', first_name: 'First', last_name: 'Student', password: 'password', password_confirmation: 'password', email: 'student@localhost.com', role: "Student-BSN")