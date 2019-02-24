@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  # show the students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  # do what the user has asked
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, please try again."
  end
end

def input_students
  puts "Please enter the student's name"
  puts "To finish, just hit return twice"
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
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
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
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  return if @students == nil
  cohorts = @students.map { |student| student[:cohort] }
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort members..."
    @students.each do |student|
      puts "#{student[:name]}" if student[:cohort] == cohort
    end
  end
end

def print_footer
  return puts "Sadly we have no students right now" if @students == nil 
  puts @students.count == 1 ?
  "We have 1 great student" :
  "Overall, we have #{@students.count} great students"
end

interactive_menu