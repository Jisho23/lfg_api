class Honor < ApplicationRecord
  belongs_to :honored, :class_name => 'User'
  belongs_to :honorer, :class_name => 'User'
end
