# Modify existing factory
FactoryGirl.modify do
  factory :base_variant do
    package_type "poly"
  end
end

# Packages
FactoryGirl.define do
  factory :package, class: Spree::Package do
    sequence(:name) { |n| "Package Container #{n}" }
    package_type "poly"
    height 0.1
    width 0.1
    depth 0.1

    trait :letter do
      package_type "letter"
    end

    trait :tube do
      package_type "tube"
    end

    trait :packing_material do
      packing_material true
    end
  end
end
