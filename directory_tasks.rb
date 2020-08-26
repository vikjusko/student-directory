
def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)

#tasks chapter 8
#task number 1
def print_with_index(students)
students.each_with_index do |student, index|
  puts "#{index +1}. #{student[:name]} "
end
end

#task number 2
def print_n(students)
  students.select { |student|
    if student.start_with?("N")
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end }
end

#task number 3
def short(students)
  students.select do |student|
    if student.length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

#task number 4
def print(students)
  while !students.empty? do
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

#task number 5
