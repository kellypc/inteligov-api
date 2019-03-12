FactoryBot.define do
	factory :user do
		name { Faker::Name }
    password { 'password' }
    email { Faker::Internet.email }
	end
end
