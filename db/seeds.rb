admin = Member.create(
    :username => "test",
    :email => "admin@gmail.com",
    :password => "123456",
    :password_confirmation => "123456",
    :role => 4,
    :approve => 1
)
