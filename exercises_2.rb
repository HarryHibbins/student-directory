@students = [] # An empty array accessible to all methods

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    name = STDIN.gets.chomp
    
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
    process(STDIN.gets.chomp)
  end 
end 

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end 

def process(selection)
   case selection 
    when "1"
     input_students()
    when "2"
      show_students()
    when "3"
     filename = get_file_name
      if filename == ""
          save_students
      else
          save_students(filename)
      end
    when "4"
        filename = get_file_name
        if filename == ""
          puts "already loaded"
        else
          load_students_with_filename(filename)
        end
    when "9"
      
      exit
      
    else
      puts "I don't know what you meant, try again"
    end 
    puts "#{selection} selected"
end

def get_file_name
    puts "File name: "
    filename = STDIN.gets.chomp
    return filename
end

def show_students      
    print_header
    print_students_list
    print_footer
end

def save_students(filename = "students.csv")
  # open the file for writing
  file = File.open(filename,  "w")
  # iterate over each student
  @students.each do |student| 
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if !filename.nil?
    load_students_with_filename(filename)
  else
    load_students()
  end      
end 

def load_students_with_filename(filename = "students.csv")
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
  end 
end 


def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
  #file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end 
  end
end 

myCode = File.read($0)
puts myCode

try_load_students()
interactive_menu()


