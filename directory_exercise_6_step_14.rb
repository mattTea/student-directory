@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    user_option(STDIN.gets.chomp) # <- default for gets is STDIN only when no files are present as args
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  puts "Please enter filename to save students to."
  filename = STDIN.gets.chomp
  if filename == "" || !File.exists?(filename)
    puts "Could not find that file, students saved to 'students.csv' instead."
    filename = "students.csv"
  end
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def add_students_to_array(students_hash)
  @students << students_hash
end

def load_students(filename = "")
  puts "Please enter filename to load students from."
  filename = STDIN.gets.chomp
  if filename == "" || !File.exists?(filename)
    puts "Could not find that file, using 'students.csv' instead."
    filename = "students.csv"
  end
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_students_to_array({name: name, cohort: cohort.to_sym})
    end
  end
end

def try_load_students
  filename = ARGV.first # <- first argument from the command line
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from '#{filename}'"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def user_option(selection)
  case selection
  when "1"
    puts "You selected '1' - input students"
    puts "--------------------------------"
    input_students
  when "2"
    puts "You selected '2' - show students"
    puts "--------------------------------"
    show_students
  when "3"
    puts "You selected '3' - save students"
    puts "--------------------------------"
    save_students
  when "4"
    puts "You selected '4' - load students"
    puts "--------------------------------"
    load_students
  when "9"
    puts "You selected '9' - exit program"
    puts "--------------------------------"
    exit
  else
    puts "I don't know what you meant, please try again."
  end
end

def input_students
  months = [
    :Jan, :Feb, :Mar, :Apr, :May, :Jun,
    :Jul, :Aug, :Sep, :Oct, :Nov, :Dec
  ]
  
  loop do
    puts "Please enter student name (to return to menu, hit return twice)"
    name = STDIN.gets.chomp
    break if name.empty?

    puts "On which cohort is #{name}?"
    cohort = STDIN.gets.chomp
    cohort = "Mar" if cohort == ""

    while !months.include? cohort.to_sym
      puts "Please enter cohort again (e.g. 'Mar')"
      cohort = STDIN.gets.chomp
    end
    add_students_to_array({name: name, cohort: cohort.to_sym})
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_student_list
  return if @students.nil?
  cohorts = @students.map { |student| student[:cohort] }
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort members..."
    @students.each do |student|
      puts "- #{student[:name]}" if student[:cohort] == cohort
    end
  end
end

def print_footer
  return puts "Sadly we have no students right now" if @students.nil? 
  puts "--------------------------------"
  puts @students.count == 1 ?
  "We have 1 great student" :
  "Overall, we have #{@students.count} great students"
  puts "--------------------------------"
end

try_load_students
interactive_menu