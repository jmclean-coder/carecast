# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'

User.destroy_all
Meal.destroy_all
Journal.destroy_all
Metric.destroy_all
Affirmation.destroy_all
UserMeal.destroy_all
UserMetric.destroy_all
JournalEntry.destroy_all

user1 = User.create(
    user_name: "jmclean",
    name: "Joshua Mclean",
    age: 26,
    birthday: DateTime.current
    )

meal1 = Meal.create(
    name: "breakfast",
    food: "apple"
)

metric1 = Metric.create(
    water_cup: 3,
    sleep_hour: 7,
    work_time: 7,
    play_time: 2,
    energy: 4,
    productivity: 3,
    motivation: 4,
    stress: 3,
    mood: 5
)


Metric.create(
    water_cup: 3,
    sleep_hour: 8,
    work_time: 4,
    play_time: 1,
    energy: 4,
    productivity: 3,
    motivation: 2,
    stress: 3,
    mood: 5
)

journal1 = Journal.create(
    title: "My Journal",
    description: "April Journal"
)

usermet1 = UserMetric.create(
    user_id: User.first.id, 
    metric_id: Metric.first.id
)
journalentry1 = JournalEntry.create(
    content: "Today I had a really good poop, and ate some apples for breakfast. 
    After that I sat down and began making this app!", 
    title: "Thoughts on today.",
    journal_id: Journal.first.id, 
    user_id: User.first.id
)

usermeal = UserMeal.create(
    meal_id: Meal.first.id,
    user_id: User.first.id
)
puts "Done!"
