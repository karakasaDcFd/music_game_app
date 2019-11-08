# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end



Match.create!(restriction_level: 18,
              date: DateTime.new(2019, 11, 14, 16, 15, 0, 0.375),
              place: "ラウンドワン河原町店")

49.times do |n|
  Match.create!(restriction_level: 13.2,
                date: DateTime.new(2019, 11, 15, 16, n, 0, 0.375),
                place: "ゲームパニック京都")
end



MusicGame.create!(name: "beatmania IIDX")
MusicGame.create!(name: "pop'n music")
MusicGame.create!(name: "Dance Dance Revolution")
MusicGame.create!(name: "jubeat")
MusicGame.create!(name: "SOUND VOLTEX")
MusicGame.create!(name: "ノスタルジア")
MusicGame.create!(name: "maimai")
MusicGame.create!(name: "CHUNITHM")
MusicGame.create!(name: "オンゲキ")
MusicGame.create!(name: "太鼓の達人")



matches = Match.order(:created_at).take(6)
3.times do
  title = Faker::Lorem.sentence(5)
  matches.each { |match| match.set_lists.create!(title: title) }
end



matches = Match.order(:created_at).take(6)
3.times do
  title = Faker::Lorem.sentence(5)
  matches.each { |match| match.ban_lists.create!(title: title) }
end
