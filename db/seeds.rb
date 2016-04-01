# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i1|
  User.create(email: Faker::Internet.email,
              password: Faker::Internet.password(6))

  2.times do
    Band.create(name: Faker::Hipster.sentence(rand(2) + 1).delete(".").titleize,
                user_id: i1 + 1)
  end
end

20.times do |i1|
  5.times do
    Album.create(name: Faker::Hipster.sentence(rand(5) + 1).delete(".").titleize,
                 band_id: i1 + 1)
  end
end

100.times do |i1|
  10.times do
    Track.create(name: Faker::Hipster.sentence(rand(5) + 1).delete(".").titleize,
                 album_id: i1 + 1)
  end
end
