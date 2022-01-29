module TasksHelper
  def select_status
    Task.statuses.keys.to_a
  end
end
