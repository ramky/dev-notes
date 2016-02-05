FactoryGirl.define do
  factory :account do
    provider           'facebook'
    name               'Ram Iyer'
  end

  factory :topic do
    name               'VIM Setup'
    description        Faker::Lorem.sentences(1)
  end

  factory :note do
    title             Faker::Lorem.words(4)
    text              Faker::Lorem.sentences(1)
  end

  factory :type do
    title             'Dev Notes'
  end

  factory :authen_whitelist do
    name              'Ram Iyer'
  end
end
