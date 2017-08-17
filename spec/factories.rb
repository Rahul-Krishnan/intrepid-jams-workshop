FactoryGirl.define do
  factory :player do
    first_name "MyString"
    last_name "MyString"
    jersey_number 1
    team nil
  end
  factory :team do
    game nil
    name "MyString"
    score 1
    player_names "MyString"
  end
  factory :game do
    
  end
end
