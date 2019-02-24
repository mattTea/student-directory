def input_students
  puts "Please enter the names of the first student"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  return if name.empty?

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
  return if students == nil
  cohorts = students.map { |student| student[:cohort] }
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort members..."
    students.each do |student|
      puts "#{student[:name]}" if student[:cohort] == cohort
    end
  end
end

def print_footer(students)
  return puts "Sadly we have no students right now" if students == nil 
  puts students.count == 1 ?
  "We have 1 great student" :
  "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)