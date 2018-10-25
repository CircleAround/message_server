class Api::RegistrationsController < ApiController
  def sign_up
    puts registration_params
    @user = User.sign_up!(registration_params)
    respond_to do |format|
      format.json do
        render '/api/users/show'
      end
    end
  end

  def login
    puts registration_params
    @user = User.login!(registration_params)
    respond_to do |format|
      format.json do
        render '/api/users/show'
      end
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email)
  end
end
