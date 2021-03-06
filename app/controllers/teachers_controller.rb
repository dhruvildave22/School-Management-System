class TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    teacher = Teacher.all
    render json: { teacher: teacher }, status: :ok
  end

  def show
    teacher = Teacher.find(params[:id])
    render json: { teacher: teacher }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      render json: { teacher: teacher }, status: :created 
    else
      render json: teacher.errors, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    teacher = Teacher.find(params[:id])
    if teacher.update(teacher_params)
      render json: { teacher: teacher }, status: :ok
    else
      render json: teacher.errors,  status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    render json: { message: 'teacher is deleted'}, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    render json: { error: 'foreignKeyViolation teacher can not be deleted'}, status: :internal_server_error
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
  def teacher_params
    params.require(:teacher).permit(:t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, :teacher_id, :student, :teacher_code)
  end
end