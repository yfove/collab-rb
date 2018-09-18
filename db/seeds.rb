Member.destroy_all
Project.destroy_all
Message.destroy_all
User.destroy_all

20.times do
user = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.free_email,
  password: 'password',
  password_confirmation: 'password'
)
project = user.projects.create!(
  name: Faker::App.name,
  description: Faker::Lorem.paragraph,
  category: Faker::Beer.name
)

user.members.create!(
  approved: true,
  owner: true,
  user_id: user.id,
  project_id: project.id
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

tp = User.create!(
  first_name: "Tyler",
  last_name: "Palef",
  email: 'tp@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
tpproject = tp.projects.create!(
  name: 'Random',
  description: "This is a fake project",
  category: "Biology"
)

tp.members.create!(
  approved: true,
  owner: true,
  user_id: tp.id,
  project_id: tpproject.id
)
