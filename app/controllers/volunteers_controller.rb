class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
    @volunteer.build_user
  end

  def index
  end

  def show
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer
    else
      render 'edit'
    end
  end

  def create
    @user_email = User.find_by_email(volunteer_params[:user_attributes][:email])
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user.role = "volunteer"
      if email_exists?(@volunteer)
        redirect_to new_volunteer_url, :error => "O email informado já está cadastrado" 
      elsif @volunteer.save
        UserMailer.email_confirmation(@volunteer).deliver
        redirect_to login_url, :notice => "Voluntário cadastrado com sucesso, confirme o email para continuar!"
      else
        render 'new'
      end
  end

  private
    def volunteer_params
      params.require(:volunteer).permit(:name, :observations, :phone, :phone1, :phone2, :user_attributes => [:email, :password, :password_confirmation])
    end

    def email_exists?(volunteer)
      if User.find_by_email(volunteer.user.email) != nil
        return true
      end

    end

end