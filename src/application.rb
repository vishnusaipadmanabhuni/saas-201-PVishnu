#require './department' # Include other files in the same directory
require_relative './department'
class Application
   attr_accessor :departments
  def initialize
    self.departments=[]
    ['EEE','MECH','CSE','CIVIL'].each do |dept|
    self.departments.push Department.new(dept)
    end
    #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new dept }
  end

  def enroll(student_name, student_department)
    #This is a sample implementation. you can write your own code
    s="a"
    department = self.departments.detect { |dept| dept.getname == student_department }
    rollno = department.enroll(student_name)
    section =rollno[3]
    if rollno == 0
      s=""
      s=s+ "Error: Seats are not available in #{student_department}"
    else
      s=""
      s=s+"You have been enrolled to #{student_department}" 
      s=s+"\nYou have been allotted section #{section}" 
      s=s+"\nYour roll number is #{rollno}"
    end
    return s
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    s1="a"
    department1= self.departments.detect {|dept| dept.get_department(student_name)!=nil}
    if department1==nil
      return "abc"
    end
    department2 = self.departments.detect {|dept| dept.getname == student_department}
    if department2==nil
      return "abc"
    end
    rollno = department2.enroll student_name
    section =rollno[3]
    if rollno != 0
      s1=""
      department1.del(student_name)
      s1=s1+"You have been enrolled to #{student_department}" 
      s1=s1+"\nYou have been allotted section #{section}" 
      s1=s1+"\nYour roll number is #{rollno}"
    else
      s1=""
     s1=s1+"Error: Seats are not available in #{student_department} "
    end
    return s1
  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    s2="a"
    department= self.departments.detect {|dept| dept.get_department(student_name)!=nil}
    if department==nil
      return "abc"
    end
    if department.get_section(section)!=nil
      department.del student_name
      rollno = department.enrolla student_name,section
      section =rollno[3]
      s2=""
      s2=s2+"You have been allotted section #{section}" 
      s2=s2+"\nYour roll number is #{rollno}"
    else
      s2=""
     s2=s2+"Error: Seats are not available in #{section} section"
    end
    return s2
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.getname == student_dept }
    if department==nil
      return "abc"
    end
    return department.get_department_view
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    department= self.departments.detect {|dept| dept.getname == student_dept}
    if department==nil
      return "abc"
    end
    return department.get_section_view section
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    department= self.departments.detect {|dept| dept.get_department(student_name)!=nil}
    if department==nil
      return "abc"
    end
    return department.stud_info student_name
  end
end
