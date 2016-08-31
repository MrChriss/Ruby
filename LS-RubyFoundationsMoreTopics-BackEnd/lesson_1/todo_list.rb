class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    if task.class == Todo
      todos << task
    else
      raise TypeError, 'can only add Todo objects.'
    end

    todos
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(place)
    if todos.length < (place - 1)
      raise IndexError
    else
      todos[place]
    end
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete_at(index)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    todos
  end

  def each
    counter = 0

    while counter < todos.length
      yield(todos[counter])

      counter += 1
    end
    self
  end

  def select
    list = TodoList.new(title)
    counter = 0

    while counter < todos.length
      list.add(todos[counter]) if yield(todos[counter])
      counter += 1
    end

    list
  end

  def find_by_title(title)
    select { |todo| todo.title == title}
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title.done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's todos")
list << todo1
list.add(todo2)
list.add(todo3)

todo4 = Todo.new("Program alot")
todo5 = Todo.new("Do something else")
todo6 = Todo.new("And yet else")

list << todo4
list << todo5
list << todo6

list.mark_done_at(1)

# puts list
# list.mark_done_at(1)
# puts list

list.each do |todo|
  puts todo
end

result = list.select do |todo|
  todo.done?
end

# puts result.inspect
puts list

p list.find_by_title("And yet else")
