require 'spec_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.testproject.v1" }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, params: { id: @user.id } , format: :json
    end

    it "returns the information about a reporter on a hash, validates email exist and contains @" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email].include? "@").to eql true
      expect(@user.email.include? "@").to eql true
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end
end