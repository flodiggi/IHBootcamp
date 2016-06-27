class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hours_worked*@hourly_rate
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, salary)
        @name = name
        @email = email
        @salary = salary
    end

    def calculate_salary
      @salary/52
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, salary, hourly_rate, hours_worked)
        @name = name
        @email = email
        @salary = salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      if @hours_worked > 40
      @salary/52 + (@hours_worked-40)*@hourly_rate
      else
      @salary/52
    end
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

    def notify_employee(employee)
            puts "Hey #{employee.name} your wage is $#{employee.calculate_salary}"
    end

    def pay_employees
      pretax = @employees.reduce(0.0) do |sum,employee|
        notify_employee(employee)
        (sum + employee.calculate_salary)
      end
      puts "The total amount payed is $#{pretax * 1.18}"
    end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
flo = HourlyEmployee.new('flo', 'flo@example.com', 15, 50)
jake = HourlyEmployee.new('jake', 'jake@example.com', 15, 50)


employees = [josh, nizar, ted, flo, jake]
payroll = Payroll.new(employees)
puts payroll.pay_employees
