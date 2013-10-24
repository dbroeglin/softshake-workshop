class Task < ActiveRecord::Base
   belongs_to :project
   validates :title, presence: true

   def complete
     update(completed: true)
   end
end
