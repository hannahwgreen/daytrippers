# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create( display_name: 'Joe Schmoe', email: 'js@mailboys.com', password: 'phillyphilly' )
u1.confirm
u2 = User.create( display_name: 'Jane Doe', email: 'jd@mailgirlz.gov', password: 'phillyphilly', admin: true )
u2.confirm
u3 = User.create( display_name: 'Ron Burgundy', email: 'ronman@mailgirlz.gov', password: 'phillyphilly', admin: true )
u3.confirm
u4 = User.create( display_name: 'Veronica Corningstone', email: 'bestanchor@mailgirlz.gov', password: 'phillyphilly', admin: true )
u4.confirm