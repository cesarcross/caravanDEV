# class ContactsController < ApplicationController
#   skip_before_action :authenticate_user!, only: %i[new create]

#   def new
#     @contact = Contact.new
#   end

#   def create
#     @contact = Contact.new(contact_params)
#     if @contact.deliver
#       # render json: { message: "Email sent successfully" }
#       flash[:notice] = "Thank you for your message."
#       redirect_to root_path
#     else
#       # render json: @contact.errors
#       render :new
#     end
#   end

#   private

#   def contact_params
#     params.require(:contact).permit(:name, :email, :message)
#   end
# end
