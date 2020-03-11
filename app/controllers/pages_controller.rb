# frozen_string_literal: true

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :authenticate_user!, only: %i[home new create]

  def home
    respond_to do |format|
      format.json
      format.html # /app/views/home/home.html.erb
      format.html.mobile # /app/views/home/home.html+mobile.erb
    end
    @page = Page.new
  end

  def new; end

  def create
    @page = Page.new(page_params)
    if @page.deliver
      # render json: { message: "Email sent successfully" }
      flash[:notice] = 'Mensagem enviada com sucesso! Responderemos em breve.'
      redirect_to root_path
    else
      # render json: @page.errors
      render :home
    end
  end

  private

  # def determine_variant
  #   variant = nil
  #   # some code to determine the variant(s) to use
  #   variant = :mobile if session[:use_mobile]

  #   variant
  # end

  def page_params
    params.require(:page).permit(:name, :email, :phone, :message)
  end
end
