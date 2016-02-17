FactoryGirl.define do
  factory :account do
    provider           'facebook'
    name               'Ram Iyer'
  end

  factory :topic do
    name               Faker::Lorem.words(4).join(' ')
    description        Faker::Lorem.sentences(1).join(' ')
  end

  factory :note do
    title             Faker::Lorem.words(4).join(' ')
    text              Faker::Lorem.sentences(1).join(' ')
  end

  factory :type do
    title             'Dev Notes'
  end

  factory :authen_whitelist do
    name              'ram iyer'
  end
end
