# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Person.destroy_all

Person.create! [
    {first_name: "Eric", last_name: "Tsai", age: 25, login: "eric", pass: "abc123"},
    {first_name: "John", last_name: "What", age: 23, login: "john", pass: "abc111"},
    {first_name: "Michael", last_name: "Sean", age: 15, login: "mmike", pass: "5566"},
    {first_name: "Josh", last_name: "Oreck", age: 55, login: "jojo", pass: "123xyz"},
    {first_name: "John", last_name: "Smith", age: 27, login: "nhoj", pass: "j4422"},
    {first_name: "Bill", last_name: "Smith", age: 75, login: "gates", pass: "richer"},
    {first_name: "LeBron", last_name: "James", age: 30, login: "strong", pass: "232323"}
]

Person.first.jobs.create! [
    { title: "Developer", company: "MS", position_id: "#1234"},
    { title: "Developer", company: "MS", position_id: "#1235"}
]

Person.last.jobs.create! [
    { title: "Sr. Developer", company: "MS", position_id: "#5234"},
    { title: "Sr. Developer", company: "MS", position_id: "#5235"}
]
