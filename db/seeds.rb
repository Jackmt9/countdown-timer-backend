# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
print('Initializing Seed Data...')

john_doe = User.create(first_name: 'John', last_name: 'Doe', email: 'john_doe@gmail.com', password: 'admin')
timer = Timer.create(time: 1612998762, user_id: john_doe.id, title: 'Test Timer')


print('Seeding Successful!')