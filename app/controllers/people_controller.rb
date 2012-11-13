class PeopleController < ApplicationController

  def new
    @person = Person.new
    @people = Person.all
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      flash[:notice] = "Success!"
      redirect_to action: :new
    else
      @people = Person.all
      flash[:alert] = "Person is invalid."
      render action: :new
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end
end
