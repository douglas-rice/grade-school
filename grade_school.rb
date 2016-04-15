class School
  def initialize
    @db = Hash.new
  end

  def empty?
    @db.empty?
  end

  def add(student, grade)
    @db[grade] = [] unless @db[grade]  # read 'unless' as 'if not'
    @db[grade] << student
  end

  def grade(level)
    @db[level]
  end

  def to_h
    sorted = @db.map{|grd, students| [grd, students.sort]}.sort
    Hash[sorted]
  end
end


# Notes for creating our "add" method:
# our structure is going to look like this:
# {2 => []}

# How do you add a value that's a hash, but the value of the 
# keys are arrays?

# Let's play around with this in IRB:

# Suppose I have a new hash
# h = {}

# And I want to have the key be an integer (let's say 2)
# And I want the value to be an array.
# So I first have to initialize it to an array.

# h[2] = []

# and then i can use the shovel operator to store values in there

# h[2] << "jim"

# and you can see that my hash is a key with an array.

# {2 => ["jim"]}

# So this means our "add" method needs to take into account 
# if the grade exists or not.

# If the grade is not there, then initialize it as an empty array
# or if it exists, if this key exists, then just append.