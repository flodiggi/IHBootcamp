class ContactController < ApplicationController
  def index
    @contacts = Contact.order("name ASC")

  end

  def new
    @contacts = Contact.order("name ASC")
  end

  def create
    contact = Contact.new(
      :name => params[:contact][:name].capitalize,
      :address => params[:contact][:address],
      :phonenumber => params[:contact][:phonenumber],
      :email => params[:contact][:email])

    if
    contact.name =~ /^$/ || contact.address =~ /^$/

    redirect_to("/contacts")
    else

    contact.save

    redirect_to("/contacts")
    end
  end

  def search
    @letter = params[:contact][:letter].capitalize
    @result = []
    @contacts = Contact.order("name ASC")
    @contacts.each do |contact|
      if contact.name.to_s.start_with? @letter
        @result.push(contact)
      end
    end
  end


  def show
    @contact = Contact.find_by(id: params[:id])

  end

  def favorite
    contact = Contact.find_by(id: params[:id])
    contact.favorite = true
    contact.save

    @favorites = []
    @contacts = Contact.order("name ASC")
    @contacts.each do |contact|
      if contact.favorite == true
        @favorites.push(contact)
      end
    end
  end


end
