# Step 8: Exercises

# 1. Use each_with_index ✅
# 2. Modify your program to only print the students whose name begins with a specific letter: Using .start_with? String method ✅
# 3. Modify your program to only print the students whose name is shorter than 12 characters. ✅
# 4. Rewrite the each() method 2 that prints all students using while or until control flow methods ✅
# 5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc. ✅
# 6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned. ✅
# 7. In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo? ✅
# 8. Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort. ✅
# 9. Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it uses the singular form when appropriate and plural form otherwise? ✅
# 10. We've been using the rstrip() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments). ✅
# 11. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement (Control Flow) to only print the list if there is at least one student in there? ✅

def input_students
  students_array = []
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
    students_array.push({ name: name, hobby: hobby, cob: cob, cohort: cohort })
    puts "Now we have #{students_array.size} #{students_array.size == 1 ? 'student.' : 'students.'}"
    name = gets.rstrip
    if name.empty?
      next
    elsif !name.empty?
      cohort = gets.rstrip.to_sym.capitalize
      hobby = gets.rstrip.to_sym
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

  students_array
end

students = input_students

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
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
      students
        .map { |hash| hash[:cohort] if cohorts.include?(hash[:cohort]) }
        .compact
        .uniq

    sort_by_cohort = {}

    students.each do |student|
      next unless cohort_list.include?(student[:cohort])

      cohort = student[:cohort]
      sort_by_cohort[cohort] = [] if sort_by_cohort[cohort].nil?
      sort_by_cohort[cohort].push(
        { name: student[:name], hobby: student[:hobby], cob: student[:cob] },
      )
    end

    # Checking if students array is not empty.
    if !students.empty?
      p sort_by_cohort
    else
      puts 'There are no entries in the directory, please enter the information.'
    end
  elsif user_input == 'L' || user_input == 'l'
    # Checking if students array is not empty.
    if students.empty?
      puts 'There are no entries in the directory, please enter the information.'
    end

    # To print a list of students
    i = 0
    while i < students.length
      if students[i][:name].start_with?('D', 'T', 'd', 't') &&
           students[i][:name].length < 12
        result =
          "#{i + 1}. #{students[i][:name]}, Hobbies: #{students[i][:hobby]}, COB: #{students[i][:cob]} (#{students[i][:cohort]} cohort)"
        puts result.center(result.length + 5)
      end
      i += 1
    end
  end
end

def print_footer(names)
  unless names.empty?
    puts "Now we have #{names.size} #{names.size == 1 ? 'student.' : 'students.'}"
  end
end

print_header
print(students)
print_footer(students)
