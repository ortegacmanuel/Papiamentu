FactoryBot.define do
  factory :user do
    email 'viewer@example.com'
    name 'Viewer'
    password 'viewer999'
    password_confirmation 'viewer999'

    trait :superadmin do
      email 'admin@example.com'
      name 'Admin'
      password 'admin999'
      password_confirmation 'admin999'

      after(:create) do |user|
        user.roles << create(:superadmin_role)
      end
    end

    trait :admin do
      email 'admin@example.com'
      name 'Admin'
      password 'admin999'
      password_confirmation 'admin999'

      after(:create) do |user|
        user.roles << create(:admin_role)
      end
    end

    trait :worker do
      email 'worker@example.com'
      name 'Worker'
      password 'worker999'
      password_confirmation 'worker999'

      after(:create) do |user|
        user.roles << create(:worker_role)
      end
    end   

    before(:create) { create :viewer_role unless Role.find_by_name('viewer') }

    after(:create) do |user|
      user.confirm
    end
  end
end
