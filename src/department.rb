class Department
    attr_accessor :dname, :sname, :asec, :bsec, :csec

    def initialize(dname)
    self.asec=[]
     @dname=dname
    self.bsec=[]
    self.csec=[]
    end

def enroll(sname,dname)
    if(asec.length < 10)
        @asec.push(sname)
        @asec=@asec.sort { |a,b| a <=> b }
        str = "You have been enrolled to #{dname}" 
        str+="\nYou have been allotted section A" 
        str+="\nYour roll number is #{dname}A0#{@asec.index(sname)+1}"
        
    elsif(bsec.length < 10)
        @bsec.push(sname)
        @bsec=@bsec.sort { |a,b| a <=> b }   
        str = "You have been enrolled to #{dname}" 
        str+="\nYou have been allotted section B" 
        str+="\nYour roll number is #{dname}B0#{bsec.find_index(sname)+1}"
    
    elsif(csec.length < 10)
        @csec.push(sname)
        @csec=@csec.sort { |a,b| a <=> b }
        str = "You have been enrolled to #{dname}" 
        str+="\nYou have been allotted section C" 
        str+="\nYour roll number is #{dname}C0#{csec.find_index(sname)+1}"
    else
        str="Error: Seats are not available in #{dname}"
    end   
    return str 
end


def getdepsec()
    sec=[];
    sec.push(asec);
    sec.push(bsec);
    sec.push(csec);
    return sec
end    
end
