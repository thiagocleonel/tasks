require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    User.create(email: "u1@gmail.com",password: "123123",password_confirmation: "123123")
    @task = Task.create(title: "title1",description: "description1",user: User.first)
  end

  context "Create" do
    it "creating" do
      expect(Task.all.size).to eq(1)
    end
  end

  context "Default values:" do
    it "check default value" do
      expect(@task.status).to eq(0)
    end
  end

  context "Methods:" do
    it "check method remove" do
      @task.remove
      expect(@task.status).to eq(1)
    end
  end

end
