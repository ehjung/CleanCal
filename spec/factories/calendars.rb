# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar, :class => 'Calendars' do
    scheduleid 1
  end
end
