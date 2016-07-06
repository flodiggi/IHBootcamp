# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Project.create(name:"Crazy project", description: "you wont believe it").time_entries.create(hours: 1)
Project.create(name:"Time tracking app")
Project.create(name:"Recipees", description: "for all the foodies")
Project.create(name:"Crazy project1", description: "you wont believe it1")
Project.create(name:"Time tracking app1")
Project.create(name:"Recipees1", description: "for all the foodies1")
Project.create(name:"Crazy project2", description: "you wont believe it2")
Project.create(name:"Time tracking app2")
Project.create(name:"Recipees2", description: "for all the foodies2")
Project.create(name:"Crazy project3", description: "you wont believe it3")
