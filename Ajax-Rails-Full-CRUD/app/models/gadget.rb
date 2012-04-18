# == Schema Information
#
# Table name: gadgets
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  widget_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Gadget < ActiveRecord::Base
  belongs_to :widget
end
