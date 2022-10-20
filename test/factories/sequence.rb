FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :avatar, :name, :description] do |n|
    "string#{n}"
  end

  sequence :state do
    'new_task'
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

end
