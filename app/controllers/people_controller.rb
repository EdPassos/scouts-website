class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    person = Person.new person_params
    if person.save
      redirect_to :back, notice: "Dados de #{person.first_name} #{person.last_name} guardados"
    else
      render :new
    end
  end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :middle_names, :birthday)
  end
end
