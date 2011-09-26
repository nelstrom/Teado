module TasksHelper
  def assigned_to_options()
    options = User.all.
      reject { |u| u.id == current_user.id }.
      collect { |u| [u.username, u.id] }
    options.unshift ["me", current_user.id] 
  end
end
