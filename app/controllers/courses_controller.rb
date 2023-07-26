class CoursesController < ApplicationController
	def create
		@course = Course.new(course_params)
		if @course.save
			@course = @course.as_json(include: [ :tutors ])
			render json: @course, status: 200
		else
			render json: {errors: @course.errors.full_messages}, status: 422
		end
	end

	def index
		@courses = Course.all.as_json(include: [ :tutors ])
    	render json: @courses
	end

	private

	def course_params
		params.require(:course).permit(:id, :name, :subject, :cost, tutors_attributes: [:id, :name, :age, :experience, :_destroy])
	end
end