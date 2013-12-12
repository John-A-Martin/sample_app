namespace :db do

  desc "Fill database with sample data"
  task populate: "environment" do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
    admin = make_user("John Martin", "jam_ak_2004@yahoo.com", "foobar")
    admin.toggle!(:admin)
    make_user("Joyce Martin",      "joyce@acrusintravel.com", "foobar")
    make_user("Julianna Martin",   "jm@horses.com",           "foobar")
    make_user("Jeremiah Martin",   "jam@houses.com",          "foobar")
    make_user("John Martin II",    "j_martinii@yahoo.com",    "foobar")
    make_user("Jennifer Martin",   "jen@my.com",              "foobar")
    make_user("Chris Martin",      "maxer@test.com",          "foobar")
#    make_user("", email: "", password: "foobar")
    60.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      make_user(name, email, password)
    end
end

def make_user(name, email, password)
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

def make_microposts
    users = User.all(limit:6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
