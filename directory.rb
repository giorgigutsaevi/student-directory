# defining our input_students method, so the code is more interactive
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# creating an empty students array
	students = []
	# saving user's input into a `name` variable
	name = gets.chomp
	# while the name variable is NOT empty, repeat this code
	while !name.empty?
		# add the student hash to our students array
		students.push({name: name, cohort: :november})
		puts "Now we have #{students.size} students"
		# get another name from the user, if the user inputs a name, repeat while loop
		# If not, we will exit the while loop and return our students array
		name = gets.chomp
	end
	# implicitly, return our array of students
	students
end

# instead of hardcoding our students, we will get them from our input_students method
students = input_students

# created a print_header method. This will display the header. 
def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

# created a print method, that will print all our students dynamically. 
def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

# created a print_footer method, that will print our footer for us.
def print_footer(names)
	puts "Overall, we have #{names.count} great students"
end

# Note that above, we just defined our methods. Nothing happens until we call/invoke them!
print_header
print(students)
print_footer(students)
