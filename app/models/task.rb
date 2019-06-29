class Task < ApplicationRecord
  belongs_to :user

  def remove
    self.update(status:1)
  end

end
