# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Listing.destroy_all
FollowListing.destroy_all
Comment.destroy_all

# seed image urls
# file = open(url)
# user.image.attach(io: file, filename: "temp.#{file.content_type_parse.first.split("/").last}", content_type: file.content_type_parse.first)

lebron = User.create!({first_name: "LeBron", last_name: "James", email: "Lebron@gmail.com", password: "123", pro_pic: ENV['Default1'], city: "Akron", state: "OH", realtor: false})
# lebron.image.attach(io: File.open('app/assets/images/default-avatar.png'), filename: 'default-avatar.png', content_type: 'image/png')
yoan = User.create!({first_name: "Yoan ", last_name: "Ante", email: "Yoan@gmail.com", password: "123", pro_pic: ENV['Default2'], city: "New York", state: "NY", realtor: true})
selena = User.create!({first_name: "Selena ", last_name: "Gomez", email: "Selena@gmail.com", password: "123", pro_pic: ENV['Default3'], city: "Los Angeles", state: "CA", realtor: false})
posty = User.create!({first_name: "Post ", last_name: "Malone", email: "Postmalone@gmail.com", password: "123", pro_pic: ENV['Default4'], city: "Houston", state: "TX", realtor: false})
kim = User.create!({first_name: "Kim ", last_name: "Kardashian", email: "Kimk@gmail.com", password: "123", pro_pic: ENV['Default5'], city: "Los Angeles", state: "CA", realtor: true})
tony = User.create!({first_name: "Tony ", last_name: "Soprano", email: "Tony@gmail.com", password: "123", pro_pic: ENV['Default6'], city: "Meadowlands", state: "NJ", realtor: false})
admin = User.create!({first_name: "admin ", last_name: "admin", email: "admin", password: "123", pro_pic: ENV['Default7'], city: "unknown", state: "??", realtor: true})
carole = User.create!({first_name: "Carole ", last_name: "Baskin", email: "Carole@gmail.com", password: "123", pro_pic: ENV['Default8'], city: "Tampa Bay", state: "FL", realtor: true})

p "users seeded"

listing_one = Listing.create!({owner_id: kim.id, price: 3300000, p_contact: "111-555-5555", address: "432 Park Ave", city: "New York", state: "NY", zipcode:"10010", neighborhood: "Midtown", features: "stainless steel fridge, wine bar", bed: 2, bath: 1, sqr_foot: 1200, default_image: [ENV['Aimg1'], ENV['Aimg2'], ENV['Aimg3'], ENV['Aimg4']], longitude: 40.7616, latitude: 73.9718 })
listing_two = Listing.create!({owner_id: yoan.id, price: 1800000,  p_contact: "222-555-5555", address: "405 East 42nd Street", city: "New York", state: "NY", zipcode: "10017", neighborhood: "SoHo", features: "marble countertops, coffee maker", bed: 3, bath: 2, sqr_foot: 1500, default_image: [ENV['Bimg1'], ENV['Bimg2'], ENV['Bimg3']], longitude: 40.7549, latitude: 73.9840 })
listing_three = Listing.create!({owner_id: posty.id, price: 630000, p_contact: "333-555-5555", address: "1601 E NASA Pkwy", city: "Houston", state: "TX", zipcode: "77058", neighborhood: "Clear Lake", features: "garage, backyard patio", bed: 5, bath: 5, sqr_foot: 5200, default_image: [ENV['Cimg1'], ENV['Cimg2'], ENV['Cimg3']], longitude: 29.5518, latitude: 95.0983 })
listing_four = Listing.create!({owner_id: selena.id, price: 3200000, p_contact: "444-555-5555", address: "2800 E Observatory Rd", city: "Los Angeles", state: "CA", zipcode: "90027", neighborhood: "HollyWood Hills", features: "pool, 5 car garage", bed: 6, bath: 6, sqr_foot: 6100, default_image: [ENV['Dimg1'], ENV['Dimg2'], ENV['Dimg3']], longitude: 34.1184, latitude: 118.3004 })
listing_five = Listing.create!({owner_id: kim.id, price: 400000, p_contact: "555-555-5555", address: "1 Six Flags Blvd", city: "Jackson", state: "NJ", zipcode: "08527", neighborhood: "Monmouth", features: "driveway", bed: 5, bath: 3, sqr_foot: 4700, default_image: [ENV['Eimg1'], ENV['Eimg2'], ENV['Eimg3']], longitude: 74.4406, latitude: 40.1386 })
listing_six = Listing.create!({owner_id: tony.id, price: 1300000, p_contact: "666-555-5555", address: "14 Aspen Dr", city: "North Caldwell", state: "NJ", zipcode: "07006", neighborhood: "North Caldwell", features: "kids playground, unfinished basement", bed: 7, bath: 6, sqr_foot: 5600, default_image: [ENV['Fimg1'], ENV['Fimg2'], ENV['Fimg3'], ENV['Fimg4']], longitude: 40.1703, latitude: 74.0164 })
listing_seven = Listing.create!({owner_id: posty.id, price: 1500000, p_contact: "333-555-5555", address: "125 Blossom St", city: "San Francisco", state: "CA", zipcode: "94016", neighborhood: "San Francisco", features: "large backyard, modern finishes", bed: 5, bath: 7, sqr_foot: 3600, default_image: [ENV['Gimg1'], ENV['Gimg2'], ENV['Gimg3'], ENV['Gimg4']] })

p "listings seeded"

listing_one.images.attach(io: open(ENV['Aimg1']), filename: 'list1.png', content_type: 'image/png')
listing_one.images.attach(io: open(ENV['Aimg2']), filename: 'list2.png', content_type: 'image/png')
listing_one.images.attach(io: open(ENV['Aimg3']), filename: 'list3.png', content_type: 'image/png')
listing_one.images.attach(io: open(ENV['Aimg4']), filename: 'list4.png', content_type: 'image/png')

p "listing images uploaded"

FollowListing.create(follower_id: kim.id, listing_id: listing_four.id)
FollowListing.create(follower_id: lebron.id, listing_id: listing_one.id)
FollowListing.create(follower_id: lebron.id, listing_id: listing_three.id)
FollowListing.create(follower_id: lebron.id, listing_id: listing_five.id)
FollowListing.create(follower_id: selena.id, listing_id: listing_six.id)
FollowListing.create(follower_id: tony.id, listing_id: listing_three.id)
FollowListing.create(follower_id: carole.id, listing_id: listing_six.id)
p "follow-listings seeded"

Comment.create(user_id: kim.id, listing_id: listing_four.id, content: 'cool')
Comment.create(user_id: tony.id, listing_id: listing_three.id, content: 'Will be contacting you')
Comment.create(user_id: tony.id, listing_id: listing_three.id, content: 'love it')
Comment.create(user_id: selena.id, listing_id: listing_six.id, content: 'nice place')
Comment.create(user_id: lebron.id, listing_id: listing_one.id, content: 'thats a big one')
Comment.create(user_id: selena.id, listing_id: listing_six, content: 'sweet!')
Comment.create(user_id: carole.id, listing_id: listing_six, content: 'any close bike paths?')
p "comments seeded"

p "Seeds have been planted"