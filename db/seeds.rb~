def init
  #Rake::Task['db:reset'].invoke
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

  s = Salesperson.new(email: "salesperson@gmail.com", password: "salesperson", default_locale_id: default_locale.id)
  s.build_supervision(salesmanager_id: m.id)
  s.save!

  u = Customer.create!(email: "customer@gmail.com", password: "customer", default_locale_id: default_locale.id)
  u.save!

  u = Vendor.create!(email: "marvinsshop@gmail.com", password: "marvinshop", default_locale_id: default_locale.id)
  u.save!

  MarketingStrategy.create!(name: "Front page banner", is_active: true)
  MarketingStrategy.create!(name: "Sells featured products", is_active: false)

  p = PaymentMethod.new(database_name: "Cash")
  p.descriptions.build(name: "Cash", locale_id: Locale.find_by_abbr("en"))
  p.save!
  p = PaymentMethod.new(database_name: "Credit Card")
  p.descriptions.build(name: "Credit Card", locale_id: Locale.find_by_abbr("en"))
  p.save!
  p = PaymentMethod.new(database_name: "PayPal Express")
  p.descriptions.build(name: "PayPal", locale_id: Locale.find_by_abbr("en"))
  p.save!

  f = Frequency.new
  f.descriptions.build(name: "Annually", locale_id: Locale.find_by_abbr("en"))
  f.save!
  f = Frequency.new
  f.descriptions.build(name: "Monthly", locale_id: Locale.find_by_abbr("en"))
  f.save!
  f = Frequency.new
  f.descriptions.build(name: "Daily", locale_id: Locale.find_by_abbr("en"))
  f.save!
  f = Frequency.new
  f.descriptions.build(name: "Hourly", locale_id: Locale.find_by_abbr("en"))
  f.save!
  f = Frequency.new
  f.descriptions.build(name: "Every 30 minutes", locale_id: Locale.find_by_abbr("en"))
  f.save!
  f = Frequency.new
  f.descriptions.build(name: "Every 15 minutes", locale_id: Locale.find_by_abbr("en"))
  f.save!

  build_item_types

  20.times do |i|
    u = Vendor.create(email: "vendor#{i}@gmail.com", password: "vendor#{i}", default_locale_id: default_locale.id)
    (rand(2)+1).times do
      shop = create_shop(u)
      shop.accountabilities.build(user_id: s.id)
    end
    u.save!
    add_options(u)
    add_tags(u)
  end
end

def build_item_types
  CONFIG["item_types"].each do |k, v|
    i = v["klass"].constantize.new
    add_descriptions_to_describable_hash(v, i)
    v["tag_groups"].each do |k, v|
      g = i.tag_groups.build
      add_descriptions_to_describable_hash(v, g)
      v["tags"].each do |k, v|
        t = g.tags.build
        add_descriptions_to_describable_hash(v, t)
      end
    end
    i.save!
  end
end

def add_descriptions_to_describable_hash(h, describable)
    h["descriptions"].each do |k, v|
      #puts "key: #{k}"
      #puts "value: #{v}"
      add_description(describable, v["name"], Locale.find_by_abbr(v["locale_abbr"]))
    end
end

def add_tags(u)
  u.shops.each { |s| s.update_attributes tag_ids: tag_ids }
end

def add_description(describable, name, locale = Locale.find_by_abbr("en"))
  describable.descriptions.build(name: name, locale_id: locale.id)
end

def create_shop(user)
  shop = user.shops.build(delivery_minimum: random_zero(1000, 0.1), currency_id: Currency.all.sample.id,
                          delivery_fee: random_zero(1000, 0.4),
                          banner: File.open(random_banner), thumbnail: File.open(random_thumbnail),
                          is_active: true )
  %w[monday tuesday wednesday thursday friday saturday sunday].each do |d|
    set_time(shop, "closes_#{d}_at")
    set_time(shop, "opens_#{d}_at")
    set_time(shop, "checkin_at")
    set_time(shop, "checkout_at")
  end
  add_contact(shop)
  add_descriptions(shop)
  shop.participations.build(marketing_strategy_id: 1) if rand > 0.8
  add_choices(shop)
  add_menus(shop)
  return shop
end

def add_descriptions(obj)
  %w[en pt].each do |locale|
    obj.descriptions.build(locale_id: Locale.find_by_abbr(locale).id, name: Faker::Lorem.words(rand(3)+1).join(" "),
                            body: Faker::Lorem.sentences(rand(3)+1).join(" ")
    )
  end
end

def add_choices(shop)
  (rand(20)+1).times do
    choice = shop.choices.build(is_active: true, price: rand(500) + 1)
    add_descriptions(choice)
  end
end

def tag_ids
  ts = Tag.scoped.pluck(:id)
  ts.sample(rand(8))
end

def add_options(user)
  user.shops.each do |shop|
    zrand(10).times do
      min = rand(4)
      option = shop.options.build(min_required: min, max_allowed: min + rand(3))
      add_descriptions(option)
      option.save!
      zrand(5).times do
        option.possibilities.create!(choice_id: shop.choices.all.sample.id)
      end
    end

    shop.items.each do |item|
      if rand > 0.9
        zrand(4).times do
          item.customizations.create!(option_id: shop.options.all.sample.id)
        end
      end
    end
  end
end

def zrand(n)
  rand(n) + 1
end

def add_contact(obj)
  obj.build_contact(street: "938 Julius Nyerere", province: "Maputo",
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

def add_menus(shop)
  (rand(3)+1).times do
    menu = shop.menus.build(is_active: true, item_type_id: ItemType.all.sample.id)
    add_descriptions(menu)
    add_menu_sections(menu)
  end
end

def add_menu_sections(menu)
  (rand(5)+1).times do
    section = menu.menu_sections.build(is_active: true)
    add_descriptions(section)
    add_items(section)
  end
end

def add_items(section, can_have_options = false)
  (rand(20)+1).times do
    item = section.items.build(price: rand(2000) + 1, is_active: true)
    add_descriptions(item)
  end
end

init
