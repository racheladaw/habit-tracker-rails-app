class CompletionDate < ApplicationRecord
  belongs_to :goal


  def datetime_to_date
    self.date.to_date
  end

end
