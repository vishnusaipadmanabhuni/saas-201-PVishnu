class Department
	attr_accessor :rollno, :name, :sname, :sec
def initialize(name)
	self.o1=3
	self.o2=3
	self.o3=3
	self.name=name
	self.sname=sname
	self.rollno=rollno
	self.sec=sec
end
def enroll(sname)
if self.o1>=1||self.o2>=1||self.o3>=1
 if  self.o1>=1
 	self.o1-=1
 	self.sec="A"
 	self.rollno=self.name+sec+self.o1.to_s
 elsif self.o2>=1
 	self.o2-=1
 	self.sec="B"
    self.rollno=self.name+sec+self.o2.to_s
 elsif self.o3>=1
 	self.o3-=1
    self.sec="CSE"
 	self.rollno=self.name+self.sec+self.o3.to_s
 else 
 	puts "me"
 end
 	puts "You have been enrolled to #{self.name} " \
    "\nYou have been allotted section #{self.rollno[-3]}" \
    "\nYour roll number is #{self.rollno}"
else
	puts "Error:outofbounds"
end
self.sname.sort
end

def change_dep(sname1,sec1)
a=sname1.index()
delete(sname1)
sname.sort
if name1=="EEE"
enroll(name1,sname1,sec1)
elsif name1=="MECH"
enroll(name1,sname1,sec1)
elsif name1=="CSE"
enroll(name1,sname1,sec1)
elsif name1=="CIVIL"
enroll(name1,sname1,sec1)
else
puts "Error:wrong dept name"
end


def change_section(sname1, name1,sec1)
rollno.delete(sname1)
rollno.sort
if name1=="EEE"
enroll(name1,sname1,sec1)
elsif name1=="MECH"
enroll(name1,sname1,sec1)
elsif name1=="CSE"
enroll(name1,sname1,sec1)
elsif name1=="CIVIL"
enroll(name1,sname1,sec1)
else
puts "no availability"
end


def viewdept(student_department)
d=Department.new
while(d.rollno[-1]>=1)
	puts "List of students:" \
    "\n- d.sname-#{d.rollno(sname)}"
end
end
def viewsection(student_department,section)
d=Department.new
while(d.rollno[-1]>=1)
	puts "List of students:" \
    "\n- d.sname-#{d.rollno(sname)}"
end
end
end