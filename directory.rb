students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Micheal Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates",
 ]



def print_header 
  # print overall number of students
  puts  "The students of Villans Academy"
  puts "----------------------"
end 

def print(names)
  names.each do |name| 
    puts name 
  end 
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end 

print_header
print(students)
print_footer(students)