Rake::Task['db:reset'].invoke

CONFIG["locales"]["languages"].each do |locale|
  Locale.create(language: locale[1]["language"], abbr: locale[1]["abbr"])
end

default_locale = Locale.find_by_abbr(CONFIG["locales"]["default_abbr"])
default_locale.update_attributes(is_default: true)

u = Marvin.create(email: "marvinmarnold@gmail.com", password: "marvin", default_locale_id: default_locale.id )
u.save!

m = Salesmanager.create(email: "salesmanager@gmail.com", password: "salesmanager",
                        default_locale_id: default_locale.id)
m.save!

u = Salesperson.new(email: "salesperson@gmail.com", password: "salesperson", default_locale_id: default_locale.id)
u.build_supervision(salesmanager_id: m.id)
u.save!

u = Customer.create(email: "customer@gmail.com", password: "customer", default_locale_id: default_locale.id)
u.save!

u = Vendor.create(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale_id: default_locale.id)
u.save!

MarketingStrategy.create(name: "Front page banner")
