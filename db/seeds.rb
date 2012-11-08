Rake::Task['db:reset'].invoke
default_locale = "en"

marvin = Role.create(name: "marvin")
admin = Role.create(name: "admin")
salesperson = Role.create(name: "salesperson")
vendor = Role.create(name: "vendor")
customer = Role.create(name: "customer")
Role.create(name: "guest")

u = marvin.users.create(email: "marvinmarnold@gmail.com", password: "marvin", default_locale: default_locale)
u.save!

u = salesperson.users.create(email: "salesperson@gmail.com", password: "salesperson", default_locale: default_locale)
u.save!

u = customer.users.create(email: "customer@gmail.com", password: "customer", default_locale: default_locale)
u.save!

u = vendor.users.create(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale: default_locale)
u.save!
