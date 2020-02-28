class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :authenticate_user!, only: %i[home new create]

  def home
    @page = Page.new
  end

  def new
  end

  def create
    @page = Page.new(page_params)
    if @page.deliver
      # render json: { message: "Email sent successfully" }
      flash[:notice] = "Mensagem enviada com sucesso! Responderemos em breve."
      redirect_to root_path
    else
      # render json: @page.errors
      render :home
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :email, :phone, :message)
  end
end
