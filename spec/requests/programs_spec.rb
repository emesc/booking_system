require "rails_helper"

RSpec.describe "Programs", type: :request do

  before do
    r1 = Role.create!(name: "Admin", description: "Can perform any CRUD operation on any resource")
    r2 = Role.create!(name: "Manager", description: "Can read items. Can create or delete user/teacher accounts")
    r3 = Role.create!(name: "Regular", description: "Can read items")

    @john = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "foobar", role_id: r1.id)
    @jane = User.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", password: "foobar", role_id: r2.id)
    @rick = User.create!(first_name: "Rick", last_name: "Sanchez", email: "ricksanchez@example.com", password: "foobar", role_id: r3.id)
  end

  describe "GET /admin/programs" do
    context "for non-logged in users" do
      before { get "/admin/programs" }

      it "should redirect to login page" do
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
        flash_message = "You need to sign in or sign up before continuing."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context "for logged in non-admin users" do
    end

    context "for logged in admin users" do
    end
  end
end