class Task < ActiveRecord::Base
   belongs_to :project

   def complete
     update(completed: true)
   end
end
