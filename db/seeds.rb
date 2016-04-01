password = SecureRandom.hex(10)
User.create!(name: "Admin", email: 'admin@example.org', password: password, password_confirmation: password, is_admin: true, terms: "1")
puts "Created admin user admin@example.org with password #{password}"
