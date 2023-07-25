class CoursesController < ApplicationController
	def create
		@course = Course.new(course_params)
		if @course.save
			render json: @course, status: 200
		else
			render json: {errors: @course.errors.full_messages}, status: 422
		end
	end

	def index
		@courses = Course.all
		render json: @courses, status: 200
	end

	private

	def course_params
		params.require(:course).permit(:name, :subject, :cost, tutors_attributes: [:name, :age, :experience])
	end
end