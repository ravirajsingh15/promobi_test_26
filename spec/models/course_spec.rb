require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Validations" do
    it "is not valid with new only" do
      expect(Course.new).to_not be_valid
    end
    it "is not valid with name only" do
      expect(Course.new(name: "Ruby On Rails course")).to_not be_valid
    end
    it "is not valid with subject only" do
      expect(Course.new(subject: "Hindi")).to_not be_valid
    end
    it "is not valid with subject and cost" do
      expect(Course.new(subject: "Physics", cost: 20.0)).to_not be_valid
    end
    it "is not valid with name and cost" do
      expect(Course.new(name: "Ruby On Rails course", cost: 30.0)).to_not be_valid
    end
    it "is valid with name and subject" do
      expect(Course.new(name: "Ruby On Rails course", subject: "Math")).to be_valid
    end

  end
  describe "Associations" do
    it "has many tutors" do
      assc = Course.reflect_on_association(:tutors)
      expect(assc.macro).to eq :has_many
    end
  end
end