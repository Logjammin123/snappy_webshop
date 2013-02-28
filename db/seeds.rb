# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

prng = Random.new(1234)

('A'..'H').each do |cat_letter|
  category = Category.create(name: "#{cat_letter}")
  ('A'..'Z').each do |prod_letter|
    category.products.create(
                              name: "#{cat_letter}#{prod_letter}", 
                              description: Faker::Lorem.sentence,
                              price: (prng.rand * 100)
                            )
  end
end

normal_price_group = DiscountGroup.create(name: 'Default', discount: 0)
reseller_price_group = DiscountGroup.create(name: 'Reseller', discount: 15)

(1..10).each do |i|
  password = Faker::Internet.email.reverse
  user = User.create(
               first_name: Faker::Name.first_name, 
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password, 
               discount_group_id: (i.even? ? DiscountGroup.first.id : DiscountGroup.last.id)
             )
  (1..2).each do
    Product.where(:id => (1..20)).sample(1).first.ratings.create(value: rand(1..5), user_id: user.id)
  end
end

User.create(
             first_name: 'Bob',
             last_name: 'Smith',
             email: 'bob@aol.com',
             password: '123',
             password_confirmation: '123',
             discount_group_id: reseller_price_group.id
           )

User.create(
             first_name: 'Alice',
             last_name: 'Smith',
             email: 'alice@aol.com',
             password: '123',
             password_confirmation: '123',
             discount_group_id: normal_price_group.id
           )

  