require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @attrs = {
      email: "schnulli@bulli.com",
      name: "Schnulli Bulli",
      password: "123123123",
      password_confirmation: "123123123",
      terms: "1"
    }
  end

  it "can be created" do
    expect(User.new(@attrs)).to be_valid
  end

  it "must require the terms to be accepted" do
    @attrs[:terms] = false
    expect(User.new(@attrs)).to_not be_valid
  end

  it "must have a locale set after creation" do
    user = User.create!(@attrs)
    expect(user.locale).to_not be(nil)
  end

  it "can have a participation in projects" do
    user = User.create!(@attrs)
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    expect(project1).to be_valid
    expect(project2).to be_valid

    part = user.participations.create!({ project: project1 })
    expect(part).to be_valid

    expect(user.participation_in(project1)).not_to be(nil)
    expect(user.participation_in(project2)).to be(nil)
  end

end
