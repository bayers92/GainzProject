module ApplicationHelper
  def current_auth_resource
    if admin_signed_in?
      current_admin
    elsif user_signed_in?
      current_user
    end
  end
	def current_ability
	  @current_ability ||= case
	                       when current_user
	                         UserAbility.new(current_user)
	                       when current_admin
	                         AdminAbility.new(current_admin)
	                       else
	                         GuestAbility.new(User.new)
	                       end
	end
end
