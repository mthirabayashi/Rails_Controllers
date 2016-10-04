class ContactSharesController < ApplicationController

  def create
    contactshare = ContactShare.new(contactshare_params)
    if contactshare.save
      render json: contactshare
    else
      render(
        json: contactshare.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contactshare = ContactShare.find(params[:id])
    contactshare.destroy
    render json: contactshare
    # redirect_to users_url, status:303
  end
  private
  def contactshare_params
    params.require(:contactshare).permit(:contact_id, :user_id)
  end
end
