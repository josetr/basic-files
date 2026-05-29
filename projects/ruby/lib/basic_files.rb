# frozen_string_literal: true

require "date"

Task = Struct.new(:title, :status, :due, keyword_init: true)

module BasicFiles
  module_function

  def summarize(tasks)
    tasks.each_with_object(Hash.new(0)) do |task, counts|
      counts[task.status] += 1
    end
  end

  def label(task)
    case task.status
    when :done
      "#{task.title}: complete"
    else
      "#{task.title}: #{task.status}"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  tasks = [
    Task.new(title: "Add Ruby fixture", status: :doing, due: Date.new(2026, 5, 27)),
    Task.new(title: "Try syntax themes", status: :todo, due: nil)
  ]
  puts BasicFiles.summarize(tasks)
end
