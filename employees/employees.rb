# pages 137-154 in Head First Ruby

class Employee
  attr_reader :name

  def name=(name)
    if name == ""
      raise "Name can't be blank"
    end
    @name = name
  end

  def print_name
    puts "Name: #{name}"
  end
end

class SalariedEmployee < Employee
  attr_reader :salary

  def salary=(salary)
    if salary < 0
      raise "A salary of #{salary} isn't valid"
    end
    @salary = salary
  end

  def print_pay_stub
    print_name
    pay_for_period = (salary/365.0) * 14
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end

class HourlyEmployee < Employee
  attr_reader :hourly_wage, :hours_per_week

  def hourly_wage=(hourly_wage)
    raise "A wage of #{hourly_wage} isn't valid" if hourly_wage < 0
    @hourly_wage = hourly_wage
  end

  def hours_per_week=(hours_per_week)
    raise "#{hours_per_week} hours per week isn't valid" if hours_per_week < 0
    @hours_per_week = hours_per_week
  end

  def print_pay_stub
    print_name
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end

salaried_employee = SalariedEmployee.new
salaried_employee.name = "Jane Doe"
salaried_employee.salary = 50000
salaried_employee.print_pay_stub

hourly_employee = HourlyEmployee.new
hourly_employee.name = "John Smith"
hourly_employee.hourly_wage = 14.97
hourly_employee.hours_per_week = 30
hourly_employee.print_pay_stub
