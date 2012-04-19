# == Schema Information
#
# Table name: widgets
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Widget < ActiveRecord::Base
  validates_presence_of :name
  has_many :gadgets
  attr_accessible :name, :description
end
