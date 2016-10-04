class ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    # user.email
    if contact.update(contact_params)
      redirect_to contacts_url, status:303
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
    # redirect_to users_url, status:303
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
