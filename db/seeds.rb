# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@local.host')
admin.password = 'admin'
admin.save

developer = Developer.find_or_create_by(first_name: 'developer', last_name: 'dev', email: 'dev@local.host')
developer.password = 'dev'
developer.save


manager = Manager.find_or_create_by(first_name: 'manager', last_name: 'manager', email: 'manager@local.host')
manager.password = 'manager'
manager.save


task = Task.find_or_create_by(name: 'task', author_id: 3, assignee_id: 2, state: 'new_task')
task.save

# 60.times do |i|
#   u = [Manager, Developer].sample.new
#   u.email = "email#{i}@mail.gen"
#   u.first_name = "FN#{i}"
#   u.last_name = "LN#{i}"
#   u.password = "#{i}"
#   u.save
# end

i = 1

3.times do |i|
  t = [Task].sample.new
  t.name = "new_task_task#{i}"
  t.author_id = manager.id
  t.assignee_id = developer.id
  t.state = 'new_task'
  t.expired_at = Date.current
  t.description = "desc#{i}"
  t.save
end


# 200.times do |i|
#   t = [Task].sample.new
#   t.name = "in_qa_task#{i}"
#   t.author_id = manager.id
#   t.assignee_id = developer.id
#   t.state = 'in_qa'
#   t.expired_at = Date.current
#   t.description = "desc2#{i}"
#   t.save
# end


# t.string "name"
# t.text "description"
# t.integer "author_id"
# t.integer "assignee_id"
# t.string "state"
# t.date "expired_at"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false



# 10.times do |i|
#   t = [Task].sample.new
#   u.email = "email#{i}@mail.gen"
#   u.first_name = "FN#{i}"
#   u.last_name = "LN#{i}"
#   u.password = "#{i}"
#   u.save
# end
