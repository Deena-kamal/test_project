require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "email exists and of type email" do
    it { should validate_presence_of :email }
    it { should allow_value('dina.ahmed@trianglz.com').for(:email) }
    it { should_not allow_value('dina.ahmedtrianglz.com').for(:email) }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "if password and confirm password doesnt match" do
    before { @user.password = "123" }
    it { should_not be_valid }
  end


end