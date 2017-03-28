FactoryGirl.define do

  factory :user do
    email                 {Faker::Internet.email}
    password              "{1#{Faker::Internet.password(8)}}"
    name                  {Faker::Name.name}
    created_at            {Faker::Time.between(2.days.ago, Time.now)}
  end

end
