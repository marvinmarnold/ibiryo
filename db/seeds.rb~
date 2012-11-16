def init
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

  30.times do |i|
    u = Vendor.create(email: "vendor#{i}@gmail.com", password: "vendor#{i}", default_locale_id: default_locale.id)
    (rand(2)+1).times do
      create_shop(u)
    end
    u.save!
  end
end

def create_shop(user)
  shop = user.shops.build(delivery_minimum: random_zero(1000, 0.1), currency_id: Currency.all.sample.id,
                          delivery_fee: random_zero(1000, 0.4), tag_list: Faker::Lorem.words(rand(4)+1).join(","),
                          banner: File.open(random_banner), thumbnail: File.open(random_thumbnail),
                          is_active: true )

  %w[monday tuesday wednesday thursday friday saturday sunday].each do |d|
    set_time(shop, "closes_#{d}_at")
    set_time(shop, "opens_#{d}_at")
  end
  add_contact(shop)
  add_descriptions(shop)
  shop.participations.build(marketing_strategy_id: 1) if rand > 0.8
end

def add_descriptions(obj)
  %w[en pt].each do |locale|
    obj.descriptions.build(locale_id: Locale.find_by_abbr(locale).id, name: Faker::Lorem.words(rand(3)+1).join(" "),
                            body: Faker::Lorem.sentences(rand(3)+1).join(" ")
    )
  end
end

def add_contact(obj)
  obj.build_contact(street: "938 Julius Nyerere", province: "Maputo", district: "Maputo",
                    city: "Maputo", primary_phone: "825077787")
end

def random_zero(upper_limit, zero_likelihood = 0.5)
  (rand() < zero_likelihood) ? 0 : rand(upper_limit)
end

def set_time(obj, atr)
  yesterday = Time.now - 60 * 60 *24
  obj.update_attributes(atr => rand(yesterday..Time.now))
end

def root
  "app/assets/images/"
end

def random_banner
  "#{root}banner#{rand(5)+1}.jpg"
end

def random_thumbnail
  "#{root}logo#{rand(14)+1}.jpg"
end

init
