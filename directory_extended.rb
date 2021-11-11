@students = []
@csv_file = ''

def save_students
  # open the file for writing
  puts "What would you like to name your file?"
  @csv_file = STDIN.gets.chomp
  if @csv_file.empty?
    puts "Please name your file and add a `.csv` extension."
    return
  else
      file = File.open(@csv_file, 'w')
  end
  # iterate over the array of our students
  @students.each do |student|
    student_data = [
      student[:name],
      student[:cohort],
      student[:hobby],
      student[:cob],
    ]
    csv_line = student_data.join(', ')
    file.puts csv_line
  end
  file.close
end

def load_students(filename = @csv_file)
  if !File.exists?(filename)
    puts 'The file you are searching for does not exist. Please make sure to input the students.'
    interactive_menu
  end
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort, hobby, cob = line.chomp.split(', ')
    add_students(name, hobby, cob, cohort)
    puts line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Name your .csv file & save the list'
  puts '4. Load the list'
  puts '9. Exit'
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    selection = STDIN.gets.chomp

    case selection
    when '1'
      puts "OPTION 1: INPUT STUDENT INFORMATION"
      students = input_students
    when '2'
      puts "OPTION 2: DISPLAY STUDENT INFORMATION "
      show_students
    when '3'
      puts "OPTION 3: SAVE STUDENT INFORMATION TO A CSV FILE"
      save_students
    when '4'
      puts "OPTION 4: LOAD STUDENT INFORMATION TO A CSV FILE"
      load_students
    when '9'
      puts "PROGRAM TERMINATED"
      exit
    else
      puts 'Please enter a valid command and try again.'
    end
  end
end

def input_students
  puts 'Please enter the name, cohort, hobbies and country of birth of students'
  puts 'To finish, just hit return twice'
  name = STDIN.gets.rstrip
  puts 'Enter cohort:'
  cohort = STDIN.gets.rstrip.to_sym.capitalize
  puts 'Enter hobbies:'
  hobby = STDIN.gets.rstrip.to_sym
  puts 'Enter country of birth:'
  cob = STDIN.gets.rstrip.to_sym
  until name.empty?
    add_students(name, hobby, cob, cohort)
    puts "Now we have #{@students.size} #{@students.size == 1 ? 'student.' : 'students.'}"
    name = STDIN.gets.rstrip
    if name.empty?
      next
    elsif !name.empty?
      puts 'Enter cohort:'
      cohort = STDIN.gets.rstrip.capitalize
      puts 'Enter hobbies:'
      hobby = STDIN.gets.rstrip
      puts 'Enter country of birth:'
      cob = STDIN.gets.rstrip
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

def add_students(name, hobby, cob, cohort)
  @students.push(
    { name: name, hobby: hobby.to_sym, cob: cob.to_sym, cohort: cohort.to_sym },
  )
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students_list
  puts 'How would you like to print our students?'
  puts 'Enter `C` to sort by Cohort OR `L` for Listed: '
  user_input = STDIN.gets.rstrip

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

try_load_students
interactive_menu

# Step 8: Solve Additional Exercises ✅
# Step 9: Add an interactive menu ✅
# Step 10: Do more refactoring (add an instance variable on the main object) ✅
# Step 11: Saving data to a file ✅
# Step 12: Loading the data from a file ✅
# Step 13: Taking args from the command line ✅
