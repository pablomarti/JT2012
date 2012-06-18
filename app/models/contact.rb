class Contact < ActiveRecord::Base
  belongs_to :country
  attr_accessible :comment, :email, :lastname, :mobile, :name, :country_id
end
