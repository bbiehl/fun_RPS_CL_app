# filepath ./RPS/lib/player.rb

class Player
  class NameValidator
    def self.is_valid?(name)
      if (/^[\w+ ]{3,12}$/).match(name) != nil
        return true
      else
        return false
      end
    end
  end

  def set_name(name=nil)
    until NameValidator::is_valid?(name) == true do
      print "Enter name: "
      name = gets.chomp.to_s.strip
      NameValidator::is_valid?(name)
      if NameValidator::is_valid?(name) == false
        invalid_name_message(name)
      end
    end
    @name = name
  end

  def get_name
    @name
  end

 def invalid_name_message(name)
    puts "#{name} is an Invalid Entry."
    puts "Violation [a-zA-z0-9_]{3,12}]"
    puts "Try Again\n"
  end
end
