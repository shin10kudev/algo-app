# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_list = [
  "Array",
  "String",
  "Brute Force",
  "Sorts",
  "Greedy",
  "Stacks & Qeues",
  "Recursive",
  "Linked Lists",
  "Binary Tree",
  "Heap",
  "Other"
]

category_list.each do |name|
  Category.create( name: name )
end
