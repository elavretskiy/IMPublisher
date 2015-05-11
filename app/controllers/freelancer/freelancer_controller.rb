class Freelancer::FreelancerController < Freelancer::BaseController
  respond_to :html
  layout 'freelancer'

  def index
    @freelancer = Freelancer.new
  end

  def contact_me
    @freelancer = Freelancer.new(freelancer_params)
    FreelancerMailer.contact_me(freelancer_params[:email]).deliver_now if @freelancer.save

    redirect_to freelancer_path
  end

  private

  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone, :message)
  end
end
