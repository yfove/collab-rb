Member.destroy_all
Project.destroy_all
Message.destroy_all
User.destroy_all

20.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

10.times do
  Project.create!(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph,
    category: Faker::Beer.name
  )
end

15.times do
  Message.create!(
    content: Faker::Lorem.paragraph,
    private: false,
    user_id: User.pluck(:id).sample,
    project_id: Project.pluck(:id).sample
  )
end

15.times do
  Member.create!(
    approved: false,
    owner: false,
    user_id: User.pluck(:id).sample,
    project_id: Project.pluck(:id).sample
  )
end
