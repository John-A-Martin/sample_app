namespace :db do

  desc "Fill database with sample data"
  task populate: "environment" do
    admin = User.create!(name:  "John Martin",
                 email: "jam_ak_2004@yahoo.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    User.create!(name:  "Joyce Martin",
                 email: "joyce@acrusintravel.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name:  "Julianna Martin",
                 email: "jm@horses.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name:  "Jeremiah Martin",
                 email: "jam@houses.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name:  "John Martin II",
                 email: "j_martinii@yahoo.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name:  "Jennifer Martin",
                 email: "jen@my.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    User.create!(name:  "Chris Martin",
                 email: "maxer@test.com",
                 password: "foobar",
                 password_confirmation: "foobar")
#    User.create!(name:  "",
#                 email: "",
#                 password: "foobar",
#                 password_confirmation: "foobar")
    60.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
