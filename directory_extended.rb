@students = []

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of our students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '9. Exit' # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu

    # 2. read the input and save it into a variabl
    selection = gets.chomp

    # 3. do what the user has asked
    case selection
    when '1'
      students = input_students
    when '2'
      show_students
    when '3'
      save_students
    when '9'
      exit
    else
      puts 'Please enter a valid command and try again.'
    end
  end
end

def input_students
  puts 'Please enter the name, cohort, hobbies and country of birth of students'
  puts 'To finish, just hit return twice'
  name = gets.rstrip
  puts 'Enter cohort:'
  cohort = gets.rstrip.to_sym.capitalize
  puts 'Enter hobbies:'
  hobby = gets.rstrip.to_sym
  puts 'Enter country of birth:'
  cob = gets.rstrip.to_sym
  until name.empty?
    @students.push({ name: name, hobby: hobby, cob: cob, cohort: cohort })
    puts "Now we have #{@students.size} #{@students.size == 1 ? 'student.' : 'students.'}"
    name = gets.rstrip
    if name.empty?
      next
    elsif !name.empty?
      puts 'Enter cohort:'
      cohort = gets.rstrip.to_sym.capitalize
      puts 'Enter hobbies:'
      hobby = gets.rstrip.to_sym
      puts 'Enter country of birth:'
      cob = gets.rstrip.to_sym
      if cohort.empty?
        cohort = 'tbd'
      elsif hobby.empty?
        hobby = 'tbd'
      elsif cob.empty?
        cob = 'tbd'
      end
    else
      puts 'Name is not a String'
    end
  end
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students_list
  puts 'How would you like to print our students?'
  puts 'Enter `C` to sort by Cohort OR `L` for Listed: '
  user_input = gets.rstrip

  if user_input == 'C' || user_input == 'c'
    # To print students grouped by cohort:
    cohorts = %i[
      January
      February
      March
      April
      May
      June
      July
      August
      September
      October
      November
      December
    ]

    cohort_list =
      @students
        .map { |hash| hash[:cohort] if cohorts.include?(hash[:cohort]) }
        .compact
        .uniq

    sort_by_cohort = {}

    @students.each do |student|
      next unless cohort_list.include?(student[:cohort])

      cohort = student[:cohort]
      sort_by_cohort[cohort] = [] if sort_by_cohort[cohort].nil?
      sort_by_cohort[cohort].push(
        { name: student[:name], hobby: student[:hobby], cob: student[:cob] },
      )
    end

    # Checking if students array is not empty.
    if !@students.empty?
      p sort_by_cohort
    else
      puts 'There are no entries in the directory, please enter the information.'
    end
  elsif user_input == 'L' || user_input == 'l'
    # Checking if students array is not empty.
    if @students.empty?
      puts 'There are no entries in the directory, please enter the information.'
    end

    # To print a list of students
    i = 0
    while i < @students.length
      if @students[i][:name].start_with?('D', 'T', 'd', 't') &&
           @students[i][:name].length < 12
        result =
          "#{i + 1}. #{@students[i][:name]}, Hobbies: #{@students[i][:hobby]}, COB: #{@students[i][:cob]} (#{@students[i][:cohort]} cohort)"
        puts result.center(result.length + 5)
      end
      i += 1
    end
  end
end

def print_footer
  unless @students.empty?
    puts "Now we have #{@students.size} #{@students.size == 1 ? 'student.' : 'students.'}"
  end
end

interactive_menu

# Step 8: Solve Additional Exercises ✅
# Step 9: Add an interactive menu ✅
# Step 10: Do more refactoring (add an instance variable on the main object) ✅
