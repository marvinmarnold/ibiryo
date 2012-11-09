Rake::Task['db:reset'].invoke
default_locale = "en"

u = Marvin.create(email: "marvinmarnold@gmail.com", password: "marvin", default_locale: default_locale)
u.save!

m = Salesmanager.create(email: "salesmanager@gmail.com", password: "salesmanager", default_locale: default_locale)
m.save!

u = Salesperson.new(email: "salesperson@gmail.com", password: "salesperson", default_locale: default_locale)
u.build_supervision(salesmanager_id: m.id)
u.save!

u = Customer.create(email: "customer@gmail.com", password: "customer", default_locale: default_locale)
u.save!

u = Vendor.create(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale: default_locale)
u.save!
