
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array 
	students = []
	# get the first name
	name = gets.chomp 
	# while the name is not empty, repeat this code 
	while !name.empty?
	# add the student hash to the array 
	students << {name: name, cohort: :november} 
	puts "Now we have #{students.count} students"
	# get another name from the user 
	name = gets.chomp 
	end
	# return the array of students 
	students
end

def print_header 
	puts "The students of my cohort at Makers Academy"
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
  
students = input_students

print_header
print(students)
print_footer(students)


=begin
# Detecting Typos Exercise

- single-line comments were using `%` symbol instead of a hash `#` symbol 
- Line 5: To create an array [] symbol is used.  
- Line 7:  Extra space in `name = gets .chomp ` 
- Line 9: There is no keyword `when` in Ruby. Changed it to while 
- Line 9: On the same line, we can omit using `do` 
- Line 9: mispelled method `empty?`. Added negation for the while loop. 
- Line 11: The shovel operator uses `<<` symbol. Alternatively, `.push` can be used 
- Line 11: symbols as hash keys don't require `:` symbol as a prefix. Only as a suffix. Also, key-value pairs are separated by a comma
- Line 14: `gets.chomp` instead of `get.chomp`. `gets` stands for getstring 
- Line 20: `print-header` <= Ruby variable naming is with an underscore `_`, not hyphen `-` 
- Line 21: `puts` instead of `put`. Also on the same line, strings must be enclosed with the same type of quation marks. "hello world" or 'hello world'
- Line 22: Backticks used to print a dividing line instead of quotation marks 
- Line 26: `print` method has an argument `students`, `each` method should also be used on `students` argument instead of singular `student` 
- Line 26: Code block parameter using 2 slashes instead of 2 pipe symbols 
- Line 27: String interpolation #{} is used with double quotation marks. String interpolation correct syntax is `#` symbol followed by curly braces {} 
- Line 27: To access a hash value with a hash key, the following syntax must be used => hash[key] 
- Line 31: `print_footer` method argument names must be inside parentheses, and no space!  
- Line 32: Wrong syntax for String interpolation and mispelled print
- Line 35: Invoking the wrong function, variables must use snake_casing. It's `input_students` 
- Line 37: Wrong method invocation syntax for the argument - use () instead of {} 
- Line 38: Again, wrong syntax for invocation - use () instead of [] 

=end
