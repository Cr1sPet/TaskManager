class Api::V1::TasksController < Api::V1::ApplicationController
  def index
    puts 'TaskController index1'
    tasks = Task.all.
    ransack(ransack_params).
    result.
    page(page).
    per(per_page)

    puts 'PARAMS254'
    puts params

    respond_with(tasks, each_serializer: TaskSerializer, root: 'items', meta: build_meta(tasks))

  end

  def show
    task = Task.find(params[:id])

    respond_with(task, serializer: TaskSerializer)
  end

  def create
    task = current_user.my_tasks.new(task_params)
    task.save

    respond_with(task, serializer: TaskSerializer, location: nil)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)

    respond_with(task, serializer: TaskSerializer)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    respond_with(task)
  end

  def self.responder
    JsonResponder
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :author_id, :assignee_id, :state_event, :expired_at)
  end

  # def ransack_params
  #   params.permit(:page, :per_page)
  # end

end
