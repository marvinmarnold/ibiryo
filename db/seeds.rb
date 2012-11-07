Rake::Task['db:reset'].invoke
default_locale = "en"

u = User.create(email: "marvinmarnold@gmail.com", password: "marvin", default_locale: default_locale)
u.role = "marvin"
u.save!

u = User.create(email: "salesperson@gmail.com", password: "salesperson", default_locale: default_locale)
u.role = "salesperson"
u.save!

u = User.create(email: "customer@gmail.com", password: "customer", default_locale: default_locale)
u.role = "customer"
u.save!

u = User.create(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale: default_locale)
u.role = "vendor"
u.save!
