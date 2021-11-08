# let's put all our students into an array
students = [
	"Dr. Hannibal Lecter",
	"Darth Vader",
	"Nurse Ratched",
	"Michael Corleone",
	"Alex DeLarge",
	"The Wicked Witch of the West",
	"Terminator",
	"Freddy Krueger",
	"The Joker",
	"Joffrey Baratheon",
	"Norman Bates"
]
# created a print_header method. This will display the header. 
def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

# created a print method, that will print all our students dynamically. 
def print(names)
	names.each do |ele|
		puts ele
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
