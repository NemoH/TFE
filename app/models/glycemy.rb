class Glycemy < ActiveRecord::Base
require 'csv'
belongs_to :user
validates :valeur, presence: true,
			length: {maximum: 4}
validates :note, length: {maximum: 250}
def set_user!(user)
  	self.user_id = user.id
  	self.save!
end
 
#def self.import(file)
#	spreadsheet = open_spreadsheet(file)
#	(8 ..spreadsheet.last_row).each do |i|
#		row = Hash[[spreadsheet.row(i)]
#	CSV.forearch(file.path) do |row|
#		Product.create!
#		record = Glycemy.where(
#			:user_id =&gt; user_id,
#			:valeur =&gt; row[])
#
end
