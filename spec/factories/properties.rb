FactoryBot.define do
  factory :property do
    title 'Apartamento com vista para praia'
    description 'Apartamento a 100m da praia'
    property_type
    region
    rent_purpose 'Férias'
    area 20
    room_quantity 5
    accessibility true
    allow_pets true
    allow_smokers false
    maximum_guests 3
    minimum_rent 4
    maximum_rent 20
    daily_rate '500,50'
    main_photo File.new(Rails.root.join('spec','support','casa.jpg'))
  end 
end