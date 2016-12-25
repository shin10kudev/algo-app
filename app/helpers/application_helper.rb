module ApplicationHelper

  def has_permissions(resource_id)
    return signed_in? && current_user.id === resource_id
  end

end
