require_relative './department.rb'

class Application
 attr_accessor :departments
  
  def initialize

  self.departments=[]
  self.departments[0]=Department.new("EEE")
  self.departments[1]=Department.new("MECH")
  self.departments[2]=Department.new("CSE")
  self.departments[3]=Department.new("CIVIL")
  end


  def enroll(student_name, student_department)
    case student_department
    when "EEE"
    self.departments[0].enroll student_name,student_department
    when "MECH"
    self.departments[1].enroll student_name,student_department
    when "CSE"
    self.departments[2].enroll student_name,student_department
    when "CIVIL"
    self.departments[3].enroll student_name,student_department
    else
    puts "error:seats are not available in #{student_department}"
    end
    end

  def change_dept(student_name, student_department)
  
   temp=""
   temp1=""
   te=[]
   te.push(self.departments[0])
   te.push(self.departments[1])
   te.push(self.departments[2])
   te.push(self.departments[3])
   te.each do |dept|
      dept.getdepsec.each do|sec|
        sec.each do|name|
            if(name == student_name)
               temp=dept
               temp1=sec
            end   
        end
      end
    end  
     
     temp1.delete(student_name)
     enroll(student_name,student_department)
     
 end

  def change_section(student_name, section)
    temp=""
   temp1=""
   te=[]
   c=""
   
   te.push(self.departments[0])
   te.push(self.departments[1])
   te.push(self.departments[2])
   te.push(self.departments[3])
    te.each do |dept|
      dept.getdepsec.each do|sec|
        sec.each do|name|
            if(name == student_name)
               temp=dept
               temp1=sec
            end   
        end
      end
    end  
     temp1.delete(student_name)
     if(section=="A" && temp.asec.length<3)
          temp.asec.push(student_name)
          temp.asec.sort
          str="You have been allotted section #{section}" 
          str+="\nYour roll number is #{temp.dname}A0#{temp.asec.find_index(student_name)+1}"
          

      elsif(section=="B" && temp.bsec.length<3)
          temp.bsec.push(student_name)
          temp.bsec.sort
          #str = "You have been enrolled to #{temp.dname} " 
          str="You have been allotted section #{section}" 
          str+="\nYour roll number is #{temp.dname}B0#{temp.bsec.find_index(student_name)+1}"
          #return str

      elsif(section=="C" && temp.csec.length<3)
          temp.csec.push(student_name)
          temp.csec.sort
          #str = "You have been enrolled to #{temp.dname} " 
          str="You have been allotted section #{section}" 
          str+="\nYour roll number is #{temp.dname}C0#{temp.csec.find_index(student_name)+1}"
          #return str
      else
          str= "Error: Seats are not available in #{section}"
      end
      return str
end

  def department_view(student_dept)
    te=[]
   c=""
   temp=""
   temp1=[]
   str="List of students:"
   te.push(self.departments[0])
   te.push(self.departments[1])
   te.push(self.departments[2])
   te.push(self.departments[3])
    te.each do |dept|
      if(dept.dname==student_dept)
        temp=dept;
      end
    end
    temp.getdepsec.each do|sec|
       sec.each do|name|
           if(sec==temp.asec)
               c="A"
               temp1=temp.asec
           elsif(sec==temp.bsec)
               c="B"
               temp1=temp.bsec
           elsif(sec==temp.csec)
                c="C"    
                temp1=temp.csec
           end 
           #str+="\n#{name} - #{student_dept}#{c}0#{sec.index(name)+1}"
          end
           end
        temp1.each do|name|
          str+="\n#{name} - #{temp.dname}#{c}0#{temp1.index(name)+1}"
          
      end  
  return str
  end

  def section_view(student_dept, section)
   te=[]
   c=""
   temp=""
   temp1=""
   str="List of students:"
   te.push(self.departments[0])
     te.push(self.departments[1])
       te.push(self.departments[2])
         te.push(self.departments[3])
    te.each do |dept|
      if(dept.dname==student_dept)
        temp=dept;
    end
  end    

           if(section=='A')
               c="A"
               temp1=temp.asec
           elsif(section=="B")
               c="B"
               temp1=temp.bsec
           elsif(section=="C")
                c="C"    
                temp1=temp.csec
           end 
temp1.each do|name|
   str+="\n#{name} - #{temp.dname}#{c}0#{temp1.index(name)+1}"
  end
return str
end

def student_details(student_name)
   te=[]
   c=""
   temp=""
   rolllno=0
   temp1=""
   te.push(self.departments[0])
   te.push(self.departments[1])
   te.push(self.departments[2])
   te.push(self.departments[3])
    te.each do |dept|
     dept.getdepsec.each do|sec|
      sec.each do |name|
           if(name==student_name)
              temp1=sec
              temp=dept.dname


           end
          end
     end
    end 
    b=temp1.index(student_name)
  str="#{student_name} - #{temp} - Section A - #{temp}A01"
  return str

  end

end
