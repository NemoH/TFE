class Glycemy < ActiveRecord::Base
require 'csv'
require 'roo'

belongs_to :user
validates :valeur, presence: true,
			length: {maximum: 4}
validates :note, length: {maximum: 250}
def set_user!(user)
  	self.user_id = user.id
  	self.save!
end
 
def self.import(file)
	#filename = file.csv.path
	CSV.foreach(file) do |row|
		#date = row[1]
		#valeur = row[3]
		date, valeur, app, a, b, c, d, e, f, g, h, i, j, k, l = row
		#jourheure = Datetime.new(jour.year, jour.month, jour.day, heure.hour, heure.min,)
		#userid = current_user.id
		glycemy = Glycemy.create!(date: jour, valeur: valeur)

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
