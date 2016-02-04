FactoryGirl.define do
  factory :account do
    provider           'facebook'
    name               'Ram Iyer'
  end

  factory :topic do
    name               'VIM Setup'
    description        'All things about VIM Setup'
  end
end