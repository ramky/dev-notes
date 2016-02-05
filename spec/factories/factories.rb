FactoryGirl.define do
  factory :account do
    provider           'facebook'
    name               'Ram Iyer'
  end

  factory :topic do
    name               'VIM Setup'
    description        'All things about VIM Setup'
  end

  factory :note do
    title             Faker::Lorem.words(4)
    text              Faker::Lorem.sentences(1)
  end

  factory :type do
    title             'Dev Notes'
  end
end
