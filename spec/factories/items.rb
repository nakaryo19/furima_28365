FactoryBot.define do
  factory :item do

    name {"ネクタイ"}
    text {"2020年就活"}
    category_id {1}
    product_id {1}
    delivery_id {1}
    area_id {1}
    days_id {1}
    price {"3000"}
    association :user, factory: :user
    
  end
end
