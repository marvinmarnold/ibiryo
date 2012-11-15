Rake::Task['db:reset'].invoke

CONFIG["i18n"]["languages"].each do |locale|
  Locale.create!(language: locale[1]["language"], abbr: locale[1]["abbr"])
end

CONFIG["i18n"]["currencies"].each do |currency|
  Currency.create!(locale_abbr: currency[1]["locale_abbr"], abbr: currency[1]["abbr"])
end

CONFIG["locations"]["provinces"].values.each do |province|
  Province.create!(name: province)
end

default_locale = Locale.find_by_abbr(CONFIG["i18n"]["default_abbr"])

u = Marvin.create!(email: "marvinmarnold@gmail.com", password: "marvin", default_locale_id: default_locale.id )
u.save!

m = Salesmanager.create!(email: "salesmanager@gmail.com", password: "salesmanager",
                        default_locale_id: default_locale.id)
m.save!

u = Salesperson.new(email: "salesperson@gmail.com", password: "salesperson", default_locale_id: default_locale.id)
u.build_supervision(salesmanager_id: m.id)
u.save!

u = Customer.create!(email: "customer@gmail.com", password: "customer", default_locale_id: default_locale.id)
u.save!

u = Vendor.create!(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale_id: default_locale.id)
u.save!

MarketingStrategy.create!(name: "Front page banner", is_active: true)
