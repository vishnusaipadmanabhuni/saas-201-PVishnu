class Department
    attr_accessor :sec, :dname, :students, :rolls, :number, :asec, :bsec, :csec, :sec1, :sec2, :sec3
    def initialize(dept)
        self.dname=dept
        self.sec={'A'=>10,'B'=>10,'C'=>10}
        self.asec=[]
        self.bsec=[]
        self.csec=[]
        self.sec1=[]
        self.sec2=[]
        self.sec3=[]
        self.students=[]
        self.number=30
        self.rolls=[]
    end
    def getname
        return self.dname
    end

    def get_section(section)
        if self.sec[section]!=nil
            return self.sec[section]
        else
            return nil
        end
    end

    def stud_info(student_name)
        str=""
        self.asec.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.dname} - Section #{self.sec1[i][3]} - #{self.sec1[i]}"
            end
        end
        self.bsec.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.dname} - Section #{self.sec1[i][3]} - #{self.sec2[i]}"
            end
        end
        self.csec.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.dname} - Section #{self.sec3[i][3]} - #{self.sec3[i]}"
            end
        end
        return str
    end

    def get_department(student_name)
        i=0
        self.students.each do |stud|
            if stud == student_name
                i+=1
            end
        end
        if i>0
            return self.dname
        else
            return nil
        end     
    end

    def get_department_view
        s1="List of students:"
             self.students.each_index do |i|
                s1=s1+"\n#{self.students[i]} - #{self.rolls[i]}"
             end
        return s1
    end

    def get_section_view(section)
        s="List of students:"
        if section=='A'
            self.asec.each_index do |i|
                s=s+"\n#{self.asec[i]} - #{self.sec1[i]}"
            end
        elsif section=='B'
            self.bsec.each_index do |i|
                s=s+"\n#{self.bsec[i]} - #{self.sec2[i]}"
            end
        else
            self.csec.each_index do |i|
                str=str+"\n#{self.secc[i]} - #{self.sec3[i]}"
            end
        end
        return s
    end

    def del(student_name)
        self.students.each_with_index do |stud,i|
            if stud == student_name
                self.students.delete(student_name)
                self.number=self.number+1
                self.students.sort!
                self.rolls.delete_at(i)
            end
        end
        self.asec.each_with_index do |stud,i|
            if stud==student_name
                self.asec.delete(student_name)
                self.sec1.delete_at(i)
                self.asec.sort!
                self.sec['A']=self.sec['A']+1
            end
        end
        self.bsec.each_with_index do |stud,i|
            if stud==student_name
                self.bsec.delete(student_name)
                self.sec1.delete_at(i)
                self.bsec.sort!
                self.sec['B']=self.sec['B']+1
            end
        end
        self.csec.each_with_index do |stud,i|
            if stud==student_name
                self.csec.delete(student_name)
                self.sec1.delete_at(i)
                self.csec.sort!
                self.sec['C']=self.sec['C']+1
            end
        end
    end

    def enroll(student_name)
        if self.sec['A'] >=1
            number=10-self.sec['A']+1
            if sec['A']==1
                number=self.dname[0..2]+'A'+number.to_s
            else
                number=self.dname[0..2]+'A0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.asec[10-self.sec['A']]=student_name
            self.sec1[10-self.sec['A']]=number
            self.asec.sort!
            self.students.sort!
            self.sec['A']=self.sec['A']-1
            self.number=self.number-1
        elsif self.sec['B'] >=1
            number=10-self.sec['B']+1
            if sec['B']==1
                number=self.dname[0..2]+'B'+number.to_s
            else
                number=self.dname[0..2]+'B0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.bsec[10-self.sec['B']]=student_name
            self.sec2[10-self.sec['B']]=number
            self.bsec.sort!
            self.students.sort!
            self.sec['B']=self.sec['B']-1
            self.number=self.number-1
        elsif self.sec['C']>=1
            number=10-self.sec['C']+1
            if sec['C']==1
                number=self.dname[0..2]+'C'+number.to_s
            else
                number=self.dname[0..2]+'C0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.csec[10-self.sec['C']]=student_name
            self.sec3[10-self.sec['C']]=number
            self.csec.sort!
            self.students.sort!
            self.sec['C']=self.sec['C']-1
            self.number=self.number-1
        else
            number=0
        end
        return number
    end
    def enrolla(student_name,section)
        if  section=='A'
            number=10-self.sec['A']+1
            if section['A']==1
                number=self.dname[0..2]+'A'+number.to_s
            else
                number=self.dname[0..2]+'A0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.asec[10-self.sec['A']]=student_name
            self.sec1[10-self.sec['A']]=number
            self.asec.sort!
            self.students.sort!
            self.sec['A']=self.sec['A']-1
            self.number=self.number-1
        elsif section=='B'
            number=10-self.sec['B']+1
            if sec['B']==1
                number=self.dname[0..2]+'B'+number.to_s
            else
                number=self.dname[0..2]+'B0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.bsec[10-self.sec['B']]=student_name
            self.sec2[10-self.sec['B']]=number
            self.bsec.sort!
            self.students.sort!
            self.sec['B']=self.sec['B']-1
            self.number=self.number-1
        elsif section=='C'
            number=10-self.sec['C']+1
            if sec['C']==1
                number=self.dname[0..2]+'C'+number.to_s
            else
                number=self.dname[0..2]+'C0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.csec[10-self.sec['C']]=student_name
            self.sec3[10-self.sec['C']]=number
            self.csec.sort!
            self.students.sort!
            self.sec['C']=self.sec['C']-1
            self.number=self.number-1
        else
            number=0
        end
        return number
    end
end