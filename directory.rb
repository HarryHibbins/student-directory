

def input_students
    puts "Please enter the details of the students"
    puts "To finish, just hit return twice"
    
    students = []
    name = enter_detail("Name")

    while !name.empty? do 
            
        cohort = enter_detail("Cohort")
        hobby = enter_detail("Hobby")
        birth_place = enter_detail("Birth Place")
        height = enter_detail("Height")
        students << {name: name, cohort: cohort.to_sym, hobbies: hobby, birth_place: birth_place, height: height}
        
        unless students.count == 1
    
            puts "Now we have #{students.count} students"
        else 
            puts "Now we have #{students.count} student"
 
        end
        puts "Enter Name or enter nothing to exit"
        
    #This is to break out of while when no string is entered 
        name = gets.chomp
    end 
    return students
end 



def enter_detail(detail)
    puts "Enter #{detail}"
    input = gets.chomp
    return input
end 

    

def print_header 
  # print overall number of students
  puts  "The students of Villans Academy".center(100)
  puts "----------------------".center(100)
end 

def print(names)
    
    print_header
    
    
    counter = 0
 while counter < names.count
 # names.each_with_index do |name, index| 
      #if (name[:name][0] == "h")
      #if (name[:name].length < 12 )
          string = "#{names[counter][:name]} (#{names[counter][:cohort]} cohort) Enjoys: #{names[counter][:hobbies]} Born in: #{names[counter][:birth_place]} Height: #{names[counter][:height]}"
          puts string.center(100)
          
          counter +=1
       
  end 
end

def print_by_cohort(students, cohort)
    
  puts  "The students of Villans Academy in cohort: #{cohort}".center(100)
  puts "----------------------".center(100)
    
    students.each do |student| 
        if student[:cohort] == cohort.to_sym
          string = "#{student[:name]} (#{student[:cohort]} cohort) Enjoys: #{student[:hobbies]} Born in: #{student[:birth_place]} Height: #{student[:height]}"
          puts string.center(100)
        end
    end 
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end 




def edit_student_at_index(index, students)
    
  name = enter_detail("Name")
  cohort = enter_detail("Cohort")
  hobby = enter_detail("Hobby")
  birth_place = enter_detail("Birth Place")
  height = enter_detail("Height")

 if name != ""
       students[index][:name] = name
 end 
 
 if cohort != ""
       students[index][:cohort] = cohort
 end 
 
  if hobby != ""
       students[index][:hobbies] = hobby

 end 
 
  if birth_place != ""
       students[index][:birth_place] = birth_place

 end 
 
  if height != ""
       students[index][:height] = height
 end 




  print(students)
    
end 

students = input_students





puts "Enter Command"
command = gets.chomp

while !command.empty? do 
    
    if command.upcase == "EDIT"
        puts "Index to edit"
        index = gets.chomp
        edit_student_at_index(index.to_i, students)
    elsif command.upcase == "PRINT"
        print(students)
        print_footer(students)
    elsif command.upcase == "COHORT"
        puts "Enter cohort to view"
        cohort = gets.chomp
        print_by_cohort(students, cohort)

        
    end 
    command = gets.chomp
end 



