module TasksHelper
  def is_date date
    unless date.nil?
      date.strftime("%d/%m/%Y")
    end
  end
end
