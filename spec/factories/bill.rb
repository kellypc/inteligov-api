FactoryBot.define do
	factory :bill do
		author { Faker::Lorem.sentence }
		description { Faker::Lorem.paragraph }
	end
end
