class Glycemy < ActiveRecord::Base
require 'csv'
attr_accessor :glycemy_user

belongs_to :user
validates :valeur, presence: true,
			length: {maximum: 4},
			inclusion: {in: 0..600}
validates :note, length: {maximum: 250}
def set_user!(user)
  	self.user_id = user.id
  	self.save!
end
 
def save_with_a_user
	set_user!(glycemy_user)
	user_id = glycemy_user.id
	save!
end

def self.search(search)
	if search
		where('date LIKE ?', "%#{search}%")
	else
		scoped
	end
end

def self.search2(search2)
	if search2
		where('note LIKE ?', "%#{search2}%")
	else
		scoped
	end
end

def self.import(file, user)
	#filename = file.csv.path
	
	CSV.foreach(file.path, headers: true) do |row|
		glycemy_hash = row.to_hash
		glycemy = Glycemy.where(date: glycemy_hash["date"])

		if glycemy.count == 1
			glycemy.first.update_attributes(glycemy_hash)
		else
		@glycemy = Glycemy.new(glycemy_hash)
    	
    	
		@glycemy.user_id = user.id
		@glycemy.save!
	end
		#self.user_id = user.id
		#Glycemy.user_id = self.user_id
		#Glycemy.save
		#Glycemy.create!(glycemy_hash)
		
	
		#glycemy = Glycemy.create(date: date, valeur: valeur)

	end
	#spreadsheet = open_spreadsheet(file)
	#header = spreadsheet.row(5)
	
	#(6 ..spreadsheet.last_row).each do |i|
	#xlsx = Roo::Excelx.new(file.read)
	#xlsx.each_row do |i|
	#	xlsx.cell(i,0) => :date
	#	xlsx.cell(i,1) => :valeur
	#cell(i,0, sheet = nil) => :date
	#cell(i,1, sheet = nil) => :valeur
	#current_user.id => Glycemy.user_id
	#row = Hash[[header, spreadsheet.row(i)].transpose]
	#glycemy.attributes = row.to_hash.slice(*accessible_attributes)
	#glycemy.save!
#flash[:notice]= "New glycemies added"

end

#	CSV.forearch(file.path) do |row|
#		record = Glycemy.where(
#			:user_id => current_user.id,
#			:valeur => row[4],
#			:date => row [2])
#	end
#end
#xlsx = Roo::Excelx.new(file.read)
#xlsx.each_row do |row|
#	date = row[2]
#	value = row[4]
#	user_id = current_user.id 
#	Glycemy.create(:date => date, :valeur => value, :user_id => user_id)
#end
#end

#def self.open_spreadsheet(file)
#	case File.extname(file.original_filename)
#	when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
#	when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
#	when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
#	else raise "Unknown file type"
#	end
#end

def self.get_file_type(file)
  File.extname(file.original_filename).gsub('.','')
end

def self.open_spreadsheet(file)
  extension = get_file_type(file)
  if extension.in?(%w(csv xls xlsx))
    Roo::Spreadsheet.open(file.path, extension: extension)
  else
    raise "Unknown file type: #{file.original_filename}"
  end
end

end
