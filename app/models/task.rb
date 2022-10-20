class Task < ApplicationRecord
  state_machine initial: :new_task do
    event :to_archived do
      transition [:new_task, :released] => :archived
    end

    event :to_development do
      transition [:new_task, :in_qa, :in_code_review] => :in_development
    end

    event :to_qa do
      transition in_development: :in_qa
    end

    event :to_code_review do
      transition in_qa: :in_code_review
    end

    event :to_ready_for_release do
      transition in_code_review: :ready_for_release
    end

    event :to_released do
      transition ready_for_release: :released
    end
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }


  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
end
