module FriendsHelper
# helper for the new / edit friend views to only to display a delete button on the edit view
  def display_delete?(friend)
    if friend.id
      button_to("Delete Friend", "/users/#{current_user.id}/friends/#{friend.id}", method: :delete, data: {confirm: "Are you sure you want to delete your friend #{friend.name}?"}, style: 'background-color: #cc3700;')
    end
  end
end
