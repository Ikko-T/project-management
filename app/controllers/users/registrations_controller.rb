class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_guest_user, only: %i[update destroy]

  def ensure_guest_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "The guest user can't be updated or/and deleted."
    end
  end
end
