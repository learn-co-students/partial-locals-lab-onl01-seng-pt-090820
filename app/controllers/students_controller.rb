require 'pry'

class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def index
    query = params[:query]
    if !query.blank?
      s = Student.all
      @students = []
      s.each do |student|
        if student.name.include?(query)
          # binding.pry
          @students << student
        end
      end
    else
      @students = Student.all
    end
  end
  

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end



  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
