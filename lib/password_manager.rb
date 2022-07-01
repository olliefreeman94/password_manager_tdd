# Allow you add new, validated, passwords
# Allow you to view a specific password
# Allow you to see a list of all the services for which a password has been stored

class PasswordManager
  def initialize
    @managed_passwords = []
  end

  def add(service, password)
    if valid?(password)
      @managed_passwords << { :service => service, :password => password }
    end
  end

  def all
    string = ""
    @managed_passwords.each { |item| string += "Service: #{item[:service]}, Password: #{item[:password]}\n" }
    return string
  end

  def get_password(service)
    return @managed_passwords.each { |item| return item[:password] if item[:service] == service }
  end

  def services
    return @managed_passwords.map{ |item| "#{item[:service]}\n" }.join
  end

  def valid?(password)
    return true if password.match?(/[a-zA-Z]{5,9}\d/)
  end
end