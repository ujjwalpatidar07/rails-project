class TeachersController < ApplicationController
  before_action :authenticate_user!
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path
    else
      render :new
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to teachers_path
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    teacher_params[:student_ids].compact_blank.each do |student_id|
      next if @teacher.student_ids.include?(student_id.to_i)
      student = Student.find(student_id)
      @teacher.students << student
    end
    redirect_to teacher_path(@teacher)
  end

  private
    def teacher_params
      params.require(:teacher).permit(:name, student_ids: [])
    end
end
