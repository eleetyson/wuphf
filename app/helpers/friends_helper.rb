module FriendsHelper
# helper for the new / edit friend views to only to display a delete button on the edit view
  def display_delete?(friend)
    if friend.id
      button_to("Delete Friend", "/users/#{current_user.id}/friends/#{friend.id}", method: :delete, data: {confirm: "Are you sure you want to delete your friend #{friend.name}?"}, style: 'background-color: #cc3700;')
    end
  end

# helper for the new / edit friend views to render submit button with different text for each
  def submit_button_display(friend)
    if friend.id
      "Update Friend"
    else
      "Add Friend"
    end
  end

end
