require "password_manager"

RSpec.describe PasswordManager do
  context "when user adds password" do
    it "adds the password for a service" do
      password_manager = PasswordManager.new
      password_manager.add("netflix", "ollie123")
      expect( password_manager.all ).to eq "Service: netflix, Password: ollie123\n"
    end
  end
end