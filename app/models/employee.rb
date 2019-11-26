class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :salary_allotment
  has_many :leave
  has_one :salary

  validate :validate_employeeid
  validate :validate_phone
  # validates_format_of :mobileno, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/ , :message => "Invalid phone number"

  validate :validate_email

  def validate_employeeid
    employee = Employee.find_by(employeeid: employeeid)
    if employee.present? && employee.id != id
      errors.add(:employeeid, "Employee Id #{employeeid} Invalid. It already belongs to #{employee.mobileno} and #{employee.name}")
      return
    end
  end

  def validate_phone
    employee = Employee.find_by(mobileno: mobileno)
    if employee.present? && employee.id != id
      errors.add(:mobileno, "mobileno #{mobileno} Invalid. It already belongs to #{employee.employeeid} and #{employee.name}")
      return
    end
  end

  def validate_email
    employee = Employee.find_by(email: email)
    if employee.present? && employee.id != id
      errors.add(:email, "Email #{email} Invalid. It already belongs to #{employee.mobileno} and #{employee.name}")
      return
    end
  end


end
