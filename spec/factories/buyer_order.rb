FactoryBot.define do
  factory :buyer_order do
    # id {1}
    post_number {'123-4567'}
    prefectures_id {1}
    city {'大阪市中央区'}
    address {'南船場'}
    building_name {'マンション'}
    phone_number {'08050505050'}
    #association :order
    # association :user
    # association :item
    
  end
end
