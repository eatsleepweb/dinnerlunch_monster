class LunchToDinner < ActiveRecord::Base
  attr_accessible :description, :dinner_id, :lunch_id
  belongs_to :lunch, :class_name => "Meal"
  belongs_to :dinner, :class_name => "Meal"
  
  def to_s
    dinner.nil? ? "" : dinner.name
  end
  
  def as_json(options = {})
    {
      :name => dinner.name,
      :reason => description,
      :description => dinner.description,
      :tags => dinner.filter_list.join(", ")
    }
  end
end
