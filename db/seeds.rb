# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
    email: "user@example.com",
    password: "shortpassword", 
    password_confirmation: "shortpassword"
)

car1 = user.cars.create!(
    name: 'CAR1',
)

m1 = car1.maintenances.create!(
    title: 'Yearly checkup',
    completed_on: "1-1-2012".to_date,
    completed_mirage: 5000,
    operations_attributes: [
        {
            name: 'Engine oil change',
            description: '10w-30 castrol',
        },
        {
            name: 'Wiper rubber change',
            description: 'PIAA',
        },
        {
            name: 'Transmission oil change',
            description: '20w-50 castrol',
        },
    ]
)

m2 = car1.maintenances.create!(
    title: 'Tire and wheel change',
    completed_on: "10-1-2012".to_date,
    completed_mirage: 15000,
    operations_attributes: [
        {
            name: 'Tire change',
            description: '225/45/ZR18 Bridgestone Potenza Adrenalin RE003',
        },
        {
            name: 'Wheel change',
            description: '18in. 8.5J +40 RAYS Gram Lights 57Xtreme Rev Limit Edition',
        },
    ]
)

m3 = car1.maintenances.create!(
    title: 'Engine replace',
    completed_on: "1-1-2013".to_date,
    completed_mirage: 25000,
    operations_attributes: [
        {
            name: 'Engine oil change',
            description: '10w-20 Nutec',
        },
        {
            name: 'LLC change',
            description: 'Mazda',
        },
        {
            name: 'Spark plug change',
            description: 'NGK',
        },
        {
            name: 'Engine replace',
            description: 'Mazda',
        },
        {
            name: 'Clutch replace',
            description: 'ORC 250',
        },
    ]
)

m3 = car1.maintenances.create!(
    completed_on: "5-1-2013".to_date,
    completed_mirage: 28400,
    operations_attributes: [
        {
            name: 'Engine oil change',
            description: '10w-20 Nutec',
        },
        {
            name: 'LLC change',
            description: 'Mazda',
        },
        {
            name: 'Spark plug change',
            description: 'NGK',
        },
        {
            name: 'Engine replace',
            description: 'Mazda',
        },
    ]
)

m4 = car1.maintenances.create!(
    completed_on: "6-1-2013".to_date,
    completed_mirage: 29400,
    operations_attributes: [
        {
            name: 'Throttle cleaning',
        },
        {
            name: 'Air filter change',
            description: 'Autoexe',
        },
    ]
)

m5 = car1.maintenances.create!(
    title: 'Brake maintenance',
    completed_on: "7-1-2013".to_date,
    completed_mirage: 31400,
    operations_attributes: [
        {
            name: 'Brake disk sanding',
        },
        {
            name: 'Brake pad change',
            description: 'IDI 500',
        },
        {
            name: 'Brake air bleeding',
        },
    ]
)

m5 = car1.maintenances.create!(
    title: 'Oil change',
    completed_on: "9-1-2013".to_date,
    completed_mirage: 33400,
    operations_attributes: [
        {
            name: 'Engine oil change',
            description: '10w-30 Speedmaster',
        }
    ]
)
