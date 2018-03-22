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

t1 = Trip.create( user_id: u1.id, name: 'Atlantic City', description: "Dantooine. They're on Dantooine.")
t2 = Trip.create( user_id: u2.id, name: 'Ocean City', description: 'The more you tighten your grip, Tarkin, the more star systems will slip through your fingers.')
t3 = Trip.create( user_id: u3.id, name: 'Cape May', description: 'Hey, Luke! May the Force be with you.')
t4 = Trip.create( user_id: u4.id, name: 'Wildwood', description: 'No! Alderaan is peaceful. We have no weapons.')
t5 = Trip.create( user_id: u1.id, name: 'Independence Hall', description: 'She must have hidden the plans in the escape pod.')
t6 = Trip.create( user_id: u2.id, name: 'National Constitution Center', description: 'Send a detachment down to retrieve them, and see to it personally, Commander.')
t7 = Trip.create( user_id: u3.id, name: 'Benjamin Franklin Museum', description: "You don't believe in the Force, do you?")
t8 = Trip.create( user_id: u4.id, name: 'Pocono Mountains', description: 'I need your help, Luke. She needs your help.')
t9 = Trip.create( user_id: u1.id, name: 'Longwood Gardens', description: 'The more you tighten your grip, Tarkin, the more star systems will slip through your fingers.')
t10 = Trip.create( user_id: u2.id, name: 'Gettysburg', description: 'Escape is not his plan.')
t11 = Trip.create( user_id: u3.id, name: 'Washington, D.C.', description: 'I suggest you try it again, Luke.')

c1 = Category.create( name: 'Beaches')
c2 = Category.create( name: 'Family')
c3 = Category.create( name: 'Mountains')
c4 = Category.create( name: 'Historical')

tc1 = TripCategorization.create(trip_id: t1.id, category_id: c1.id)
tc2 = TripCategorization.create(trip_id: t2.id, category_id: c1.id)
tc3 = TripCategorization.create(trip_id: t3.id, category_id: c1.id)
tc4 = TripCategorization.create(trip_id: t4.id, category_id: c1.id)

tc5 = TripCategorization.create(trip_id: t5.id, category_id: c4.id)
tc6 = TripCategorization.create(trip_id: t6.id, category_id: c4.id)
tc7 = TripCategorization.create(trip_id: t7.id, category_id: c4.id)

tc8 = TripCategorization.create(trip_id: t8.id, category_id: c3.id)
tc9 = TripCategorization.create(trip_id: t9.id, category_id: c2.id)
tc10 = TripCategorization.create(trip_id: t10.id, category_id: c4.id)

tc11 = TripCategorization.create(trip_id: t11.id, category_id: c4.id)
tc12 = TripCategorization.create(trip_id: t11.id, category_id: c2.id)
tc13 = TripCategorization.create(trip_id: t2.id, category_id: c2.id)
tc14 = TripCategorization.create(trip_id: t4.id, category_id: c2.id)

r1 = Review.create(user_id: u1.id, body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', rating: 4, trip_id: t1.id, vote_count: 3)
r2 = Review.create(user_id: u2.id, body: 'Vestibulum molestie elementum lacus, sed rutrum justo ultrices eget.', rating: 3, trip_id: t1.id)
r3 = Review.create(user_id: u3.id, body: 'Nullam aliquet vulputate urna, at dapibus erat porta sit amet.', rating: 5, trip_id: t1.id)

r4 = Review.create(user_id: u1.id, body: 'Nullam ultrices efficitur lacus.', rating: 4, trip_id: t2.id)
r5 = Review.create(user_id: u2.id, body: 'Praesent in malesuada dolor, eu euismod sem.', rating: 3, trip_id: t2.id)
r6 = Review.create(user_id: u3.id, body: 'Ut vel risus in turpis lobortis placerat ac vel quam.', rating: 5, trip_id: t2.id)
