# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'admin', first_name: 'First', last_name: 'Admin', password: 'password', password_confirmation: 'password', email: 'admin@localhost.com', role: "Admin")
User.create(username: 'student', first_name: 'First', last_name: 'Student', password: 'password', password_confirmation: 'password', email: 'student@localhost.com', role: "Student-BSN")
User.create(username: 'lellis4', first_name: 'Laura', last_name: 'Hilb', password: 'password', password_confirmation: 'password', email: 'lellis4@emory.edu', role: "Student-MSN")
User.create(username: 'edownes', first_name: 'Elizabeth', last_name: 'Downes', password: 'password', password_confirmation: 'password', email: 'edownes@emory.edu', role: "Faculty")
User.create(username: 'rkoontz', first_name: 'Rachel', last_name: 'Koontz', password: 'password', password_confirmation: 'password', email: 'rkoontz@emory.edu', role: "Student-MSN")
User.create(username: 'micikas', first_name: 'Mary', last_name: 'Micikas', password: 'password', password_confirmation: 'password', email: 'mary.elizabeth.micikas@emory.edu', role: "Student-MSN")