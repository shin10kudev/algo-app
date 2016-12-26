module UsersHelper

  def empty_state_text(user)
    if user.id == current_user.id
      return "You haven't added any algorithms yet... Why not add one now?"
    else
      return "It looks like #{user.username} hasn't added any algorithms yet... Try checking back later!"
    end
  end

end
