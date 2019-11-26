class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:employee).permit(:name, :employeeid, :mobileno, :gender, :address, :email, :password, :password_confirmation)
  end

end