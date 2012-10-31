# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide, :class => 'Slides' do
    title "MyString"
    url "MyString"
    image "MyString"
  end
end
