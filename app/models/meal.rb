class Meal < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :lunch_to_dinners, :foreign_key => :lunch_id
  has_many :dinners, :through => :lunch_to_dinners

  accepts_nested_attributes_for :lunch_to_dinners
  accepts_nested_attributes_for :dinners
  
  acts_as_taggable
  acts_as_taggable_on :filters
end
