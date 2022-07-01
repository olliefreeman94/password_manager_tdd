# Allow you add new, validated, passwords
# Allow you to view a specific password
# Allow you to see a list of all the services for which a password has been stored

class PasswordManager
  def initialize
    @managed_passwords = []
  end

  def add(service, password)
    @managed_passwords << { :service => service, :password => password }
  end

  def all
    string = ""
    @managed_passwords.each { |item| string += "Service: #{item[:service]}, Password: #{item[:password]}\n" }
    return string
  end
end