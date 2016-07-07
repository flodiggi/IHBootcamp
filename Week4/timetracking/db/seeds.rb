# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Project.create(name:"Crazy project", description: "you wont believe it").time_entries.create(hours: 1, minutes: 20, date: 1.year.ago)
Project.create(name:"Time tracking app").time_entries.create(hours: 5, minutes: 20, date: 1.day.ago)
Project.create(name:"Recipees", description: "for all the foodies").time_entries.create(hours: 2, minutes: 20, date: 2.days.ago)
Project.create(name:"Crazy project1", description: "you wont believe it1").time_entries.create(hours: 4, minutes: 30, date: 1.day.ago)
Project.create(name:"Time tracking app1")
Project.create(name:"Recipees1", description: "for all the foodies1")
Project.create(name:"Crazy project2", description: "you wont believe it2")
Project.create(name:"Time tracking app2")
Project.create(name:"Recipees2", description: "for all the foodies2")
Project.create(name:"Crazy project3", description: "you wont believe it3")
