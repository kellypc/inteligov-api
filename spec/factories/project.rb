FactoryBot.define do
	factory :project do
		author { Faker::Lorem.sentence }
		description { Faker::Lorem.paragraph }
	end
end
