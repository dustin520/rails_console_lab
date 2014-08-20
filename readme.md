## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, 2. last_name and age
```
rails generate model Student first_name:string last_name:string age:integer
```
2. 
 Don't forget to run your migrations
 ```
 rake db:migrate
 ```

### Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age 
```
student = Student.create(:first_name=>"Dustin", :last_name=>"Yu", :age=>25)
```
```
user = Student.new
user.new_record?
user.first_name="dustin"
user.last_name="yu"
user.age=25
user=Student.new(:first_name=>"dustin",:last_name=>"yu",:age=25)
```
2. Save the student to the database
```
Done in last step, or can add `student.save`
user.save
user.id
```
3. Using the find/set/save syntax update the student's first name to taco
```
student = Student.find_by_first_name("Dustin")
student.first_name = "taco"
student.save 
OR
student.update_attributes(:first_name=>"taco")
```

4. Delete the student (where first_name is taco)
```
user = Student.find_by_first_name("taco")
user.destroy
```
5. Validate that every Student's last name is unique
```
validates_uniqueness_of :last_name
```

6. Validate that every Student has a first and last name that is longer than 4 characters
```
  validates :first_name, presence: true,
  	:length => {:minimum=>4}
  validates :last_name, presence: true,
  	:length => {:minimum=>4},
  	:uniqueness => true
```
```
validates :first_name, presence: true
validates :last_name, presence: true
validates :last_name, uniqueness => true
```
7. Validate that every first and last name cannot be empty
```
validates :first_name, presence: true
validates :last_name, presence: true
```
7. Combine all of these individual validations into one validation (using validate and a hash) 
```
  validates :first_name, presence: true,
  	:length => {:minimum=>4}
  validates :last_name, presence: true,
  	:length => {:minimum=>4},
  	:uniqueness => true
```
8. Using the create syntax create a student named John Doe who is 33 years old
```
new = Student.create(:first_name=>"John",:last_name=>"Doe",:age=>30)
new.errors
```
9. Show if this new student entry is valid
```
  new.valid?
  Student Exists (0.7ms)  SELECT  1 AS one FROM "students"  WHERE "students"."last_name" = 'Doe' LIMIT 1
 => false
```
10. Show the number of errors for this student instance
```
new.errors
 => #<ActiveModel::Errors:0x007ff7b9a29370 @base=#<Student id: nil, first_name: "John", last_name: "Doe", age: 30, created_at: nil, updated_at: nil>, @messages={:last_name=>["is too short (minimum is 4 characters)"]}>
```
11. In one command, Change John Doe's name to Jonathan Doesmith 
```
student = Student.find_by_first_name("John")
student.update_attributes(:first_name=>"Jonathan",:last_name=>"Doesmith")
```
```
new = Student.create(:first_name=>"Johnathan",:last_name=>"Doesmith",:age=>30)
```
12. Clear the errors array
```
new.errors.full_messages
new.errors.clear
```
13. Save Jonathan Doesmith
```
new.save
```
15. Find all of the Students
```
all = Student.all
```
16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error
```
user = Student.find_by_id(128)
```
17. Find the first student in the table
```
Student.first
```
18. Find the last student in the table
```
Student.last
```
19. Find the student with the last name of Doesmith
```
doe = Student.find_by_last_name("Doesmith")
```
21. Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order
```
 filter = Student.all.offset(1).limit(5).order(age: :asc)
```
20. Delete Jonathan Doesmith
```
doe.destroy
```
```
Student.where("first_name"=>"Jonathan", "last_name"=>"Doesmith").destroy_all
```

### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table









