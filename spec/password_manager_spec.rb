require "password_manager"

RSpec.describe PasswordManager do
  before(:example) do
    @password_manager = PasswordManager.new
  end

  context "when user adds password" do
    before(:example) do
      @password_manager.add("netflix", "ollie123")
      @password_manager.add("twitter", "miranda123")
    end

    it "adds the password for a service" do
      expect( @password_manager.all ).to eq "Service: netflix, Password: ollie123\nService: twitter, Password: miranda123\n"
    end

    it "returns the password for a given service" do
      expect(@password_manager.get_password("netflix")).to eq "ollie123"
    end

    it "returns a list of services" do
      expect(@password_manager.services).to eq "netflix\ntwitter\n"
    end

    it "only adds if password is valid" do
      @password_manager.add("facebook", "oll1e")
      @password_manager.add("tiktok", "olliefreeman")
      expect(@password_manager.services).to eq "netflix\ntwitter\n"
    end
  end
end