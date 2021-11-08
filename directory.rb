# let's put all our students into an array
students = [
	{name: "Dr. Hannibal Lecter", cohort: :november},
	{name: "Darth Vader", cohort: :november},
	{name: "Nurse Ratched", cohort: :november},
	{name: "Michael Corleone", cohort: :november},
	{name: "Alex DeLarge", cohort: :november},
	{name: "The Wicked Witch of the West", cohort: :november},
	{name: "Terminator", cohort: :november},
	{name: "Freddy Krueger", cohort: :november},
	{name: "The Joker", cohort: :november},
	{name: "Joffrey Baratheon", cohort: :november},
	{name: "Norman Bates", cohort: :november}
]
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

