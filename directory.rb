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
# print overall number of students
puts  "The students of Villans Academy"
puts "----------------------"

students.each do |student| 
    puts student 
end 
puts "Overall, we have #{students.count} great students"