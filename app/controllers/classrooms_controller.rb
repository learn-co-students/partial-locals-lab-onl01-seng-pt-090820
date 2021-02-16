class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = Student.all
  end

  def index
    @classrooms = Classroom.all
  end
end
