class Passwordchecker
  def rules(password)
    if
    (password =~ /\d/) &&
    (password =~ /\W/) &&
    (password =~ /[[:lower:]]/) &&
    (password =~ /[[:upper:]]/)
    return true
    end
  end
  def check_password(email, password)
    splitted = email.split(/@/)
    domain = splitted[1].split(".")
    if (password.include? splitted[0]) || (password.include? domain[0])
      return false
    elsif (password.length > 7) && rules(password) == true
        return true
    else
        return false
    end
  end
end
