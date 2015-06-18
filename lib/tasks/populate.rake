namespace :db do 

	task :populate => :environment do
		require 'populator'
		require 'faker'
		
		Glycemy.populate 100 do |glycemy|
			glycemy.valeur = Faker::Number.between(50,250)
			glycemy.user_id = 8
			glycemy.date = Faker::Date.between(2.months.ago, Date.today)
		end

		
end
	
end