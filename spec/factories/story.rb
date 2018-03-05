FactoryBot.define do
  factory :story do
    title "HN Story 1"
    text "HN top of the news story 1"
    hn_id "1234567"
  end

  factory :second_story, parent: :story do
    title "HN Story 2"
    text "HN top of the news story 2"
    hn_id "89012345"
  end
end
