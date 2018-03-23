# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Trip.delete_all
TripCategorization.delete_all
Review.delete_all
Category.delete_all

u1 = User.create( display_name: 'Joe Schmoe', email: 'js@mailboys.com', password: 'phillyphilly' )
u1.confirm
u2 = User.create( display_name: 'Jane Doe', email: 'jd@mailgirlz.gov', password: 'phillyphilly', admin: true )
u2.confirm
u3 = User.create( display_name: 'Ron Burgundy', email: 'ronman@mailgirlz.gov', password: 'phillyphilly', admin: true )
u3.confirm
u4 = User.create( display_name: 'Veronica Corningstone', email: 'bestanchor@mailgirlz.gov', password: 'phillyphilly', admin: true )
u4.confirm
u5 = User.create( display_name: 'Kelly Smith', email: 'ksmith1234@mailservice233232.com', password: 'phillyphilly' )
u5.confirm
u6 = User.create( display_name: 'Bob Jones', email: 'randomemail23410@anotheremailservice23x.com', password: 'phillyphilly' )
u6.confirm
u7 = User.create( display_name: 'Liz Johnson', email: 'randomemail23d410@anotheremailservice23x.com', password: 'phillyphilly' )
u7.confirm

t1 = Trip.create( user_id: u1.id, image_url: 'http://s3.amazonaws.com/photos.meetinac/galleries/NightSkyline.jpg', name: 'Atlantic City, NJ', description: "Atlantic City is a resort city on New Jersey's Atlantic coast that's known for its many casinos, wide beaches and iconic Boardwalk. Established in the 1800s as a health resort, today the city is dotted with glitzy high-rise hotels and nightclubs. In addition to gambling at slot machines and table games, the casinos offer spa treatments, performances by famous comedy and music acts, and high-end shopping.")
r1 = Review.create(user_id: u1.id, trip_id: t1.id, body: "As advertised, the boardwalk was a nice walk along ocean front!", rating: 4)
r2 = Review.create(user_id: u2.id, trip_id: t1.id, body: "Too many seagulls, ate my pizza, pooped on my head and were like flying rats all over the place.", rating: 1)
r3 = Review.create(user_id: u3.id, trip_id: t1.id, body: "The city has a lot to offer from a lot of very inexpensive items to buy in dozens of shops to high end shopping at the Caesars Hotel", rating: 4)
r4 = Review.create(user_id: u4.id, trip_id: t1.id, body: "It is OK if you stay along the boardwalk, however, the city on the outside is a bit worn down.  There were nice outlet shops near Caesars to look at.  I think the place needs a bit more choices in restaurants outside of casinos.", rating: 3)
r5 = Review.create(user_id: u5.id, trip_id: t1.id, body: "First time to city, and will not be the last.  Although the town a bit run down the beaches are the cleanest in the state!  Probably due to casinos footing the bill to keep clean?  Nice to see sunrise over ocean from hotel window and to take a walk along such pristine FREE beaches!", rating: 5)

t2 = Trip.create( user_id: u2.id, image_url: 'http://ocnjweeklyrentals.com/wp-content/uploads/2014/12/oceancitynj-weeklyrentals-ocnj-1024x330.png', name: 'Ocean City, NJ', description: "Ocean City is on New Jersey's coastal Jersey Shore. The city has a string of beaches and a boardwalk with shops, eateries and amusement parks. Gillian’s Wonderland Pier offers classic rides like the Giant Wheel. Playland’s Castaway Cove features several roller coasters and themed mini-golf. To the south, Corson’s Inlet State Park, with trails and a boat launch, attracts shorebirds to its dunes and wetlands.")
r1 = Review.create(user_id: u1.id, trip_id: t2.id, body: "This place was nice to visit, however, the beaches were a bot crowded.  No butt space if get to beach too late in day!  We liked the many food choices and the rides kept kids busy.", rating: 4)
r2 = Review.create(user_id: u2.id, trip_id: t2.id, body: "We drove hours to get to this town, and it was well worth it as the beaches were clean, the food great and the live entertainment on the boardwalk awesome!  We will be back!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t2.id, body: "Too crowded!", rating: 2)
r4 = Review.create(user_id: u4.id, trip_id: t2.id, body: "Was a nice visit.  Would be great if any more free parking available!  ", rating: 3)

t3 = Trip.create( user_id: u3.id, image_url:'https://upload.wikimedia.org/wikipedia/commons/b/b5/Cape_May_Beach_Ave_from_the_sea_3.JPG', name: 'Cape May, NJ', description: 'Cape May is a city and seaside resort at the tip of southern New Jersey’s Cape May Peninsula. It’s known for its grand Victorian houses such as the Emlen Physick Estate, now a museum with a preserved interior from the era. Shops and restaurants line the Washington Street Mall, 3 pedestrianized blocks of Washington Street. The Cape May Lighthouse provides views across the Delaware Bay and Atlantic Ocean.')
r1 = Review.create(user_id: u1.id, trip_id: t3.id, body: "A peaceful town just what we needed from the life in the city.  The views at the end of the state showing beach going on for miles were breath taking.", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t3.id, body: "We went here to charter a fishing boat.  Was a great time!  A bit far to drive to as it is the last town, at the last exit!  Overall was a nice stay.", rating: 4)
r3 = Review.create(user_id: u3.id, trip_id: t3.id, body: "The town was a bit too quiet for us.  Not enough night life here.", rating: 2)
r4 = Review.create(user_id: u4.id, trip_id: t3.id, body: "Too quiet, reserved, stuffy and far for us!", rating: 1)

t4 = Trip.create( user_id: u4.id, image_url: 'http://www.buywildwood.com/WILDWOOD%20SIGN.jpg', name: 'Wildwood, NJ', description: 'Wildwood is a resort city on the New Jersey coast. It sits on a barrier island known for its wide, sandy beaches. The iconic Sightseer tram car runs along the long Wildwood Boardwalk, which is packed with eateries, shops, waterparks and thrill rides. Fox Park is home to the Doo Wop Experience museum, with 1950s and ’60s artifacts that include a collection of neon signs.')
r1 = Review.create(user_id: u1.id, trip_id: t4.id, body: "This place was great!  So much to do on the boardwalk and something for everybody!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t4.id, body: "The loud youths like locusts here, too wild at night and sick of that watch the tram-car please every minute!", rating: 1)
r3 = Review.create(user_id: u3.id, trip_id: t4.id, body: "Was a great stay, so much entertainment.  The beaches a bit too wide to get to the ocean however!", rating: 4)
r4 = Review.create(user_id: u4.id, trip_id: t4.id, body: "Loved it!  Will be back!", rating: 5)
r5 = Review.create(user_id: u5.id, trip_id: t4.id, body: "So much to do here, very lively at night, but could be a bot overbearing if a large, young, loud crowd not your thing.  I enjoyed my stay.", rating: 4)

t5 = Trip.create( user_id: u5.id, image_url: 'https://www.nationalparks.org/sites/default/files/styles/wide_1x/public/shutterstock_142293898.jpg?itok=HI-EiryH', name: 'Independence Hall', description: 'Independence Hall is the building where both the United States Declaration of Independence and the United States Constitution were debated and adopted. It is now the centerpiece of the Independence National Historical Park in Philadelphia, Pennsylvania. The building was completed in 1753')
r1 = Review.create(user_id: u1.id, trip_id: t5.id, body: "If your a history buff, this is a place to be!  Security check line a bit long.", rating: 4)
r2 = Review.create(user_id: u2.id, trip_id: t5.id, body: "To be in same place as the founding fathers was awe inspiring.  So much history in one location.", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t5.id, body: "Not much to see.  Have to be a history teacher to enjoy.", rating: 2)
r4 = Review.create(user_id: u4.id, trip_id: t5.id, body: "Great place to take the family to learn the birthplace of this country.  Good for historians to visit.", rating: 5)

t6 = Trip.create( user_id: u3.id, image_url: 'https://assets.visitphilly.com/wp-content/uploads/2017/12/National-Constitution-Center-auditorium-G-Widman-2200VP-1400x787.jpg', name: 'National Constitution Center', description: "The National Constitution Center in historic Philadelphia is America's most hands on history museum. Located just two blocks from the Liberty Bell and Independence Hall, it is the only museum devoted to the U.S. Constitution and the story of we, the people.")
r1 = Review.create(user_id: u1.id, trip_id: t6.id, body: "WOW!  So much history and as they say, very hands on here! Loved it!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t6.id, body: "Line to get in too long!  Too much to read.  No food to eat!  Will not be back.", rating: 1)
r3 = Review.create(user_id: u3.id, trip_id: t6.id, body: "I will be back, as so much to discover here.  The history is so deep here.", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t6.id, body: "Interesting to visit a building devoted to a piece of paper.", rating: 4)
t7 = Trip.create( user_id: u2.id, image_url: 'https://media.wfmz.com/mara-wfmz-media-us-east-1/photo/2016/05/27/Benjamin-Franklin-Museum_2349200_ver1.0_640_360.jpg', name: 'Benjamin Franklin Museum', description: "The Benjamin Franklin Museum explores the life and legacy of Philadelphia's most famous citizen. Located in Franklin Court and part of Independence National Historical Park, the museum invites visitors to explore a variety of interactive exhibitions, personal artifacts, computer animations and hands-on displays")
r1 = Review.create(user_id: u1.id, trip_id: t7.id, body: "This guy was into everything! Learned so much in a short period of time!  Well worth it!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t7.id, body: "Politics - science - humor - printing presses - wine and good food.", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t7.id, body: "The museum is more geared towards kids and people who don’t know much about Ben Franklin. However, the demonstration printing press is awesome for all ages.", rating: 3)
r4 = Review.create(user_id: u4.id, trip_id: t7.id, body: "This was a pretty good museum. It was very interactive and hands-on; great for little kids. There was a lot I learned from this museum, including information about his life, his inventions, and historic Philadelphia. Overall, a pretty great museum about the person on the $100 bill.
", rating: 5)
t8 = Trip.create( user_id: u1.id, image_url: 'http://dwindley.com/wp-content/uploads/2017/09/d7-2.jpg', name: 'Pocono Mountains, PA', description: 'Planning a vacation to the Pocono Mountains? With our varied landscape, including 150 lakes and all four seasons, a variety of experiences offers excitement of all kinds. The Pocono Mountains, or Poconos, encompass forested peaks, lakes and valleys in the U.S. state of Pennsylvania. On the eastern edge is the bird-rich Delaware Water Gap, with river beaches and recreation facilities. Trails and bridges connect the waterfalls at nearby Bushkill Falls. Resorts dot the area, many with ski runs and water parks. Boat launches offer access to fishing in Lake Wallenpaupack to the north.
')
r1 = Review.create(user_id: u1.id, trip_id: t8.id, body: "Beautiful scenery with the leaves changing colors!  So much to take in, a playground for those who like taking photos!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t8.id, body: "So much to do on the many lakes available!  Will be back!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t8.id, body: "Been coing here for many years, and still do not get tired of the many things this place has to offer in any season!  From swimming, fishing, skiing or horseback riding, everything is here in one location!", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t8.id, body: "A lot to do with family, but must like the outdoors!", rating: 4)

t9 = Trip.create( user_id: u2.id, image_url: 'https://longwoodgardens.org/sites/default/files/wysiwyg/5258_Idea%20Garden%20Spring_Albee_%20Larry.jpg', name: 'Longwood Gardens', description: 'Longwood Gardens is an American botanical garden. It consists of over 1,077 acres of gardens, woodlands, and meadows in Kennett Square, Pennsylvania, United States in the Brandywine Creek Valley.')
r1 = Review.create(user_id: u1.id, trip_id: t9.id, body: "At first, I was like, an outdoor garden?  Big deal.  But this place really opens the eyes up with so much to see and learn.  Live music in various places.  Like a playground!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t9.id, body: "A lot of walking, but well worth the steps as each corner was something new and exciting.  Lacks any food establishments or even a vending machine would be nice.", rating: 3)
r3 = Review.create(user_id: u3.id, trip_id: t9.id, body: "We are yearly members and enjoy the much to see and do Garden!  From the water show to the fine music, this place is so peaceful and tranquil.", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t9.id, body: "We all enjoyed the many sights here,  I will say a bit pricey however.", rating: 3)
r5 = Review.create(user_id: u5.id, trip_id: t9.id, body: "Awesome.", rating: 5)

t10 = Trip.create( user_id: u3.id, image_url: 'https://secure.parksandresorts.wdpromedia.com/resize/mwImage/1/744/367/92/secure.parksandresorts.wdpromedia.com/media/abd/refresh/north-america/washington-dc-philadelphia-tour/atlantic-day-03-gettysburg.jpg', name: 'Gettysburg, PA', description: 'Gettysburg is a borough and town in the U.S. state of Pennsylvania. It’s known for Gettysburg National Battlefield, site of a turning point in the Civil War, now part of Gettysburg National Military Park. The park also includes the Gettysburg Museum and Visitor Center, displaying Civil War artifacts, and Gettysburg National Cemetery, where a memorial marks the site of Abraham Lincoln’s 1863 Gettysburg Address.')
r1 = Review.create(user_id: u1.id, trip_id: t10.id, body: "A place the historian in you must visit!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t10.id, body: "Not as excited as I thought it would be from the readings.  Much history took place here, but nothing to see", rating: 2)
r3 = Review.create(user_id: u3.id, trip_id: t10.id, body: "Beautiful landscapes that seem to go on forever.  Hard to believe so much blood shed here.", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t10.id, body: "A bit far of a drive, but was a good place to be at a historical point in our history.", rating: 5)
r5 = Review.create(user_id: u5.id, trip_id: t10.id, body: "Was nice, bit needs more places to feed the family.", rating: 3)

t11 = Trip.create( user_id: u3.id, image_url: 'http://www.nanoasiandining.com/wp-content/uploads/2016/04/CherryBlossoms-AprilBlog-1000x444-1000x390.jpg', name: 'Washington, D.C.', description: "Washington, DC, the U.S. capital, is a compact city on the Potomac River, bordering the states of Maryland and Virginia. It’s defined by imposing neoclassical monuments and buildings – including the iconic ones that house the federal government’s 3 branches: the Capitol, White House and Supreme Court. It's also home to iconic museums and performing-arts venues such as the Kennedy Center.")
r1 = Review.create(user_id: u1.id, trip_id: t11.id, body: "Wear comfortable shoes!  A lot to see, but too much walking for me!", rating: 3)
r2 = Review.create(user_id: u2.id, trip_id: t11.id, body: "All the museums are free!  So much to take in.  The parking a bit tight, suggest public transportation.", rating: 4)
r3 = Review.create(user_id: u3.id, trip_id: t11.id, body: "Can see so much history in one place.  Need at least 3 full days to take it all in.", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t11.id, body: "Good shoes, and a good camera needed as so much to see and capture.", rating: 4)
r5 = Review.create(user_id: u5.id, trip_id: t11.id, body: "I cannot say enough about this place.  It was well worth the trip.  Will be back soon!", rating: 5)

t12 = Trip.create( user_id: u6.id, image_url: 'https://2h7qju2c3qvcc3s86ekn8n0-wpengine.netdna-ssl.com/philly/wp-content/uploads/sites/2/2016/03/pma.jpg', name: 'Philadelphia Museum of Art', description: "The Philadelphia Museum of Art is the cultural heart of a great city—the place for creative play, with a surprise around every corner. The museum originally chartered in 1876 for the Centennial Exposition in Philadelphia has many things for the entire family to see and enjoy.")
r1 = Review.create(user_id: u1.id, trip_id: t12.id, body: "If you go on Sunday, you pay what you would like!  So much under one roof!  Was well worth the time.", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t12.id, body: "What can I say?  So much history here, the Rocky steps out front and a great view of the city!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t12.id, body: "A good museum to see many periods of time.  Wish it was bigger however.", rating: 4)
r4 = Review.create(user_id: u4.id, trip_id: t12.id, body: "I am a member, so many events throughout year, great place to spend time.", rating: 5)

t13 = Trip.create( user_id: u6.id, image_url: 'https://img.hipcamp.com/image/upload/c_limit,f_auto,h_1200,q_60,w_1920/v1433081265/campground-photos/rs70pskdpfslhciyxiid.jpg', name: 'Ricketts Glen State Park', description: 'Ricketts Glen State Park is a Pennsylvania state park on 13,050 acres in Columbia, Luzerne, and Sullivan counties in Pennsylvania in the United States. Ricketts Glen State Park is named for Robert Bruce Ricketts and his family. The park contains a 245 acre lake, Lake Jean. But what Ricketts Glen is most known for is the 22 named waterfalls found in the glens south of Lake Jean.')
r1 = Review.create(user_id: u1.id, trip_id: t13.id, body: "The hike to Lake Jean was great!  So many waterfalls, very peaceful.", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t13.id, body: "Bring a basket as this is the best place to have a picnic once you climb up to the lake!  Nice views!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t13.id, body: "not really an outdoor person, did enjoy my stay however.", rating: 4)
r4 = Review.create(user_id: u4.id, trip_id: t13.id, body: "The Falls Trail is beautiful ... So many waterfalls to see in such a short distance.  Get there early as upper area parking lot fills up quickly during good weather.  Make sure to wear good sturdy shoes as the trails near the falls can be slippery!", rating: 5)
r5 = Review.create(user_id: u5.id, trip_id: t13.id, body: "This park features a Y shaped trail which is basically and endless staircase following a chain of waterfalls. It's beautiful but very crowded on weekends. I would suggest visiting very early or late in the day to try and avoid the crowds.", rating: 4)

t14 = Trip.create( user_id: u6.id, image_url: 'http://www.phxvillage.com/uploads/images/images/original/241748/DSC_1475_PHX_Village_web.jpg?1496691436', name: 'Phoenixville, PA', description: 'This suburban town has gone through a major revitalization in the last 15 years and is now home to a number of craft breweries, including the incredibly-popular-in-Philly Sly Fox, as well as a slew of eclectic artists and musicians.
Pro tip: Every December check out the Harry Potter-esque Burning of the Phoenix. Blobfest is a three day event hosted by the Colonial Theatre in commemoration of the the 1958 horror-film The Blob. Blobfest is held rain or shine and the activities consist of contests, special guests, live music, etc. At 9pm there is a reenactment of the famous "running out" scene.')
r1 = Review.create(user_id: u1.id, trip_id: t14.id, body: "Came to see the burning of the Phoenix festival. Was a great time, everyone enjoyed it and the show was spectacular!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t14.id, body: "So many unique shops in one place.  This town has it all!  Well worth the trip to stop for the day, or more!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t14.id, body: "As a movie buff, i could not pass up the opportunity to see where it took place, the attack of the Blob!  The reenactment was just so enjoyable! ", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t14.id, body: "Was a spur of the moment trip to see this wonderful town and all it has to offer,  A lot of craft beer places to vist.  Will be back", rating: 4)

t15 = Trip.create( user_id: u7.id, image_url: 'https://www.getawaymavens.com/wp-content/uploads/2013/04/Hershey-Chocolate-World-PA.jpg', name: 'Hershey, PA', description: "Hershey is just east of Pennsylvania’s state capital, Harrisburg. The Hershey Story museum chronicles the community's creation as a model town for the workers at Milton Hershey’s chocolate factory. Hersheypark opened in 1907 as a modest green space but grew to include rides and attractions, including a zoo. Hershey Gardens has a rose garden and butterfly house. Hersheypark Stadium and Giant Center host concerts.")
r1 = Review.create(user_id: u1.id, trip_id: t15.id, body: "Came here for the amusement park, was top rated and the entire family had fun!  Two parks in one with half a water park!", rating: 5)
r2 = Review.create(user_id: u2.id, trip_id: t15.id, body: "The Hershey Hotel was well worth the trip as being a four diamond rated hotel, this place was so relaxing.  The full body chocolate wrap recommended for all!", rating: 5)
r3 = Review.create(user_id: u3.id, trip_id: t15.id, body: "A place that has live concerts, a hotel that gives chocolate wraps, and all the chocolate one can eat at the Hershey Museum, what can I say? ", rating: 5)
r4 = Review.create(user_id: u4.id, trip_id: t15.id, body: "Must see during holidays for the light show in park!  Go at 5:00 for sunset pricing year round.", rating: 5)
r5 = Review.create(user_id: u5.id, trip_id: t15.id, body: "One of the best parks I have been too and I been to all of them!  The rides were clean, the lines went fast, and there was plenty of food choices for all.  Will be back.", rating: 4)

c1 = Category.create( name: 'Beach')
c2 = Category.create( name: 'Family')
c3 = Category.create( name: 'Mountain')
c4 = Category.create( name: 'Historical')
c5 = Category.create( name: 'Museum')

tc1 = TripCategorization.create(trip_id: t1.id, category_id: c1.id)
tc2 = TripCategorization.create(trip_id: t1.id, category_id: c2.id)
tc3 = TripCategorization.create(trip_id: t2.id, category_id: c1.id)
tc4 = TripCategorization.create(trip_id: t2.id, category_id: c2.id)
tc5 = TripCategorization.create(trip_id: t3.id, category_id: c1.id)
tc6 = TripCategorization.create(trip_id: t3.id, category_id: c2.id)
tc7 = TripCategorization.create(trip_id: t4.id, category_id: c1.id)
tc8 = TripCategorization.create(trip_id: t4.id, category_id: c2.id)
tc9 = TripCategorization.create(trip_id: t5.id, category_id: c2.id)
tc10 = TripCategorization.create(trip_id: t5.id, category_id: c4.id)
tc11 = TripCategorization.create(trip_id: t6.id, category_id: c2.id)
tc12 = TripCategorization.create(trip_id: t6.id, category_id: c4.id)
tc13 = TripCategorization.create(trip_id: t7.id, category_id: c2.id)
tc14 = TripCategorization.create(trip_id: t7.id, category_id: c5.id)
tc15 = TripCategorization.create(trip_id: t8.id, category_id: c2.id)
tc16 = TripCategorization.create(trip_id: t8.id, category_id: c3.id)
tc17 = TripCategorization.create(trip_id: t9.id, category_id: c2.id)
tc18 = TripCategorization.create(trip_id: t10.id, category_id: c2.id)
tc19 = TripCategorization.create(trip_id: t10.id, category_id: c4.id)
tc20 = TripCategorization.create(trip_id: t11.id, category_id: c2.id)
tc21 = TripCategorization.create(trip_id: t11.id, category_id: c4.id)
tc22 = TripCategorization.create(trip_id: t11.id, category_id: c5.id)
tc23 = TripCategorization.create(trip_id: t12.id, category_id: c2.id)
tc24 = TripCategorization.create(trip_id: t12.id, category_id: c5.id)
tc25 = TripCategorization.create(trip_id: t13.id, category_id: c2.id)
tc26 = TripCategorization.create(trip_id: t13.id, category_id: c3.id)
tc27 = TripCategorization.create(trip_id: t14.id, category_id: c2.id)
tc28 = TripCategorization.create(trip_id: t15.id, category_id: c2.id)
