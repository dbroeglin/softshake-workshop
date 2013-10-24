class Project < ActiveRecord::Base
  scope :ongoing, ->() do
    where("due_date > ? or due_date is null", Time.now) 
  end
end
