json.array!(@tasks) do |task|
  json.extract! task, :title, :completed
  json.url task_url(task, format: :json)
end
