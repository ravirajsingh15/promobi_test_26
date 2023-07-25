require 'rails_helper'

describe CoursesController do
  it "create the course" do
    post :create, params: {course: {name: "Ruby On Rails course",subject: "Math.", cost: 20.0, tutors_attributes: [name: "Raviraj Singh", age: 24, experience: 1]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(200)
    expect(parsed_body[:id]).to_not eql nil
    expect(parsed_body[:name]).to eql("Ruby On Rails course")
  end
  it "should not create the course if name is not present" do
    post :create, params: {course: {subject: "English", cost: 20.0, tutors_attributes: [name: "Raviraj Singh", age: 24, experience: 1]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(422)
    expect(parsed_body[:errors]).to eql(["Name can't be blank"])
  end

  it "should list all the courses" do
    get :index
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(200)
  end
end
