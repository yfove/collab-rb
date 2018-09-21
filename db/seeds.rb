Member.destroy_all
Project.destroy_all
Message.destroy_all
User.destroy_all
Category.destroy_all
Categorization.destroy_all

Category.create!(category_type: "Biology")
Category.create!(category_type: "Chemisty")
Category.create!(category_type: "Math")
Category.create!(category_type: "Physics")
Category.create!(category_type: "Sociology")
Category.create!(category_type: "Psychology")
Category.create!(category_type: "Astronomy")
Category.create!(category_type: "Womens Studies")
Category.create!(category_type: "Philosophy")
Category.create!(category_type: "Liberal Arts")
Category.create!(category_type: "Fine Arts")
Category.create!(category_type: "Music")
Category.create!(category_type: "Film Studies")



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

50.times do
  Categorization.create!(
    category_id: Category.pluck(:id).sample,
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
)

tp.members.create!(
  approved: true,
  owner: true,
  user_id: tp.id,
  project_id: tpproject.id
)
