def input_students
  puts "Please enter the names of the first student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # gets the first name
  name = gets.chomp
  
  # Exercise 5.
  puts "What is #{name}'s nationality?"
  nationality = gets.chomp
  puts "What are #{name}'s hobbies?"
  hobbies = gets.chomp
  puts "How tall is #{name}?"
  height = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name,
                cohort: cohort.to_sym,
                nationality: nationality,
                hobbies: hobbies,
                height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter the name of the next student"
    name = gets.chomp
    break if name.empty?
    puts "What is #{name}'s nationality?"
    nationality = gets.chomp
    puts "What are #{name}'s hobbies?"
    hobbies = gets.chomp
    puts "How tall is #{name}?"
    height = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Exercise 1. (and original)
# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# Exercise 2.
# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chr == "M"
#   end
# end

# Exercise 3.
# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
#   end
# end

# Exercise 4.1
# def print(students)
#   i = 0
#   while i < students.length do
#     puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
#     i += 1
#   end
# end

# Exercise 4.2
# def print(students)
#   i = 0
#   until i == students.length do
#     puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
#     i += 1
#   end
# end

# Exercise 5.
# def print(students)
#   students.each_with_index do |student, index|
#     # to use the "\" character to split the string requires quotes on each line to allow indenting
#     puts "#{index + 1}. "\
#           "#{student[:name]} "\
#           "(#{student[:cohort]} cohort). "\
#           "Enjoys #{student[:hobbies]}. "\
#           "Is #{student[:height]} tall. "\
#           "Is #{student[:nationality]}."
#   end
# end

# Exercise 6.
def print(students)
  students.each_with_index do |student, index|
    # to use the "\" character to split the string requires quotes on each line to allow indenting
    puts "#{index + 1}. "\
          "#{student[:name]} "\
          "(#{student[:cohort]} cohort). "\
          "Enjoys #{student[:hobbies]}. "\
          "Is #{student[:height]} tall. "\
          "Is #{student[:nationality]}.".center(100)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)