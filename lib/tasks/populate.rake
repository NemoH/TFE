namespace :db do 

	task :populate => :environment do
		require 'populator'
		require 'faker'
		
		Glycemy.populate 100 do |glycemy|
			glycemy.valeur = Faker::Number.between(50,250)
			glycemy.user_id = 2
			glycemy.date = Faker::Date.between(2.months.ago, Date.today)
		end

		Insuline.populate 200 do |insuline|
			insuline.unit = Faker::Number.between(5,20)
			insuline.user_id = 2
			insuline.date = Faker::Date.between(2.months.ago, Date.today)
		end

		Carb.populate 200 do |carb|
			carb.valeur = Faker::Number.between(10,60)
			carb.user_id = 2
			carb.date = Faker::Date.between(2.months.ago, Date.today)
		end
end
	
end