require 'csv'

@students = []
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have chosen to indput a student name"
    input_students
  when "2"
    puts "You have chosen to show a list of students"
    show_students
  when "3"
    puts "You have chosen to save a student to a document"
   save_students
  when "4"
    puts "You have chosen to load the student file"
   load_students
  when "9"
    puts "You have chosen to exit"
    exit
  else
    puts "I don't know what you mean, try again please"
  end
end

def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Now, we have #{@students.count} great student" if @students.count == 1
    puts "Now we have #{@students.count} great students" if @students.count > 1
end

def save_students(filename = "students.csv")
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
  end
end
end

def load_students(filename = "students.csv")
  @students = CSV.read(filename)
  p @students
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
