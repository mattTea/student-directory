def input_students
  puts "Please enter the names of the first student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # gets the first name
  name = gets.chomp
  
  months = [
    :Jan,
    :Feb,
    :Mar,
    :Apr,
    :May,
    :Jun,
    :Jul,
    :Aug,
    :Sep,
    :Oct,
    :Nov,
    :Dec
  ]
  
  puts "On which cohort is #{name}?"
  cohort = gets.chomp
  cohort = "Mar (tbc)" if cohort == ""
  while !months.include? cohort.to_sym
    puts "Please enter cohort again (e.g. 'Mar')"
    cohort = gets.chomp
  end
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter the name of the next student"
    name = gets.chomp
    break if name.empty?
    puts "On which cohort is #{name}?"
    cohort = gets.chomp
    cohort = "Mar (tbc)" if cohort == ""
    while !months.include? cohort.to_sym
      puts "Please enter cohort again (e.g. 'Mar')"
      cohort = gets.chomp
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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