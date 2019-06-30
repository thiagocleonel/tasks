class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,:length => { :minimum => 5 }

  def remove
    self.update(status:0)
  end
end
