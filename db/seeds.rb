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

t1 = Trip.create( user_id: u1.id, name: 'Atlantic City', description: 'You should do this trip.')
t2 = Trip.create( user_id: u2.id, name: 'Ocean City', description: 'Great for the family.')
t3 = Trip.create( user_id: u3.id, name: 'Lancaster', description: 'Home of the amish.')

c1 = Category.create( name: 'Beaches')
c2 = Category.create( name: 'Family')
c3 = Category.create( name: 'Mountains')
c4 = Category.create( name: 'Historical')

tc1 = TripCategorization.create(trip_id: t1.id, category_id: c1.id)
tc2 = TripCategorization.create(trip_id: t1.id, category_id: c2.id)
tc3 = TripCategorization.create(trip_id: t2.id, category_id: c1.id)
tc4 = TripCategorization.create(trip_id: t2.id, category_id: c4.id)
tc5 = TripCategorization.create(trip_id: t3.id, category_id: c1.id)
tc6 = TripCategorization.create(trip_id: t3.id, category_id: c2.id)

