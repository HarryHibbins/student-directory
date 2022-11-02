@students = [] # An empty array accessible to all methods

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    name = gets.chomp
    
    while !name.empty? do 
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        
        name = gets.chomp
    end 
   
end 

def print_header 
  # print overall number of students
  puts  "The students of Villans Academy"
  puts "----------------------"
end 

def print_students_list()
  @students.each do |name| 
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end 
end

def print_footer()

    puts "Overall, we have #{@students.count} great students"
  
end 

def interactive_menu 
  loop do
    print_menu()
    process(gets.chomp)
  end 
end 

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end 

def process(selection)
   case selection 
    when "1"
     input_students()
    when "2"
      show_students()
    when "9"
      
      exit
      
    else
      puts "I don't know what you meant, try again"
    end 
end

def show_students      
    print_header
    print_students_list
    print_footer
end

interactive_menu()


