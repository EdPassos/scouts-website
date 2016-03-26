class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update,:destroy]

  def show
  end

  def new
    @person = Person.new
  end

  def create
    person = Person.new person_params
    if params[:person][:user_id] == nil
      person.user = current_user
    end
    if person.save
      redirect_to :back, notice: "Dados de #{person.first_name} #{person.last_name} guardados"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to :back, notice: "Dados de #{@person.first_name} #{@person.last_name} actualizados"
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to :back, notice: "Dados de #{@person.first_name} #{@person.last_name} eliminados"
  end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :middle_names, :birthday, :user_id, :photo, :section_id, :team_id)
  end

  def set_person
    @person = Person.find params[:id]
  end
end
