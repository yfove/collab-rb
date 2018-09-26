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
    looking_for: [Category.pluck(:category_type).sample]
  )

  user.members.create!(
    approved: true,
    owner: true,
    user_id: user.id,
    project_id: project.id
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
  looking_for: [Category.pluck(:category_type).sample],
  image: "https://placebear.com/#{rand(800)}/#{rand(800)}"
)

tp.members.create!(
  approved: true,
  owner: true,
  user_id: tp.id,
  project_id: tpproject.id,
  role: Category.pluck(:category_type).sample
)

bd = User.create!(
  first_name: "Billy",
  last_name: "Davidson",
  email: 'bd@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
bdproject = tp.projects.create!(
  name: 'Contrary',
  description: "Ooh LALA",
  looking_for: [Category.pluck(:category_type).sample],
  image: "https://placebear.com/#{rand(800)}/#{rand(800)}"
)

bd.members.create!(
  approved: true,
  owner: true,
  user_id: bd.id,
  project_id: bdproject.id,
  role: Category.pluck(:category_type).sample
)

35.times do
  Message.create!(
    content: Faker::Lorem.paragraph,
    private: false,
    user_id: User.pluck(:id).sample,
    project_id: Project.pluck(:id).sample
  )
end

# 25.times do
#   Message.create!(
#     content: Faker::Lorem.paragraph,
#     private: true,
#     user_id: Member.where(project_id: Project.find(params[:id])).pluck(:id).sample,
#     project_id: Project.pluck(:id).sample
#   )
# end

60.times do
  Member.create!(
    approved: false,
    owner: false,
    user_id: User.pluck(:id).sample,
    project_id: Project.pluck(:id).sample,
    role: Category.pluck(:category_type).sample
  )
end

50.times do
  Categorization.create!(
    category_id: Category.pluck(:id).sample,
    project_id: Project.pluck(:id).sample
  )
end
