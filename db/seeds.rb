# Töröljük az összes mezőt és tehenet, ha szükséges
Field.destroy_all
Cow.destroy_all

# Meglévő felhasználók lekérdezése
users = User.all

# Ellenőrizzük, hogy van-e felhasználó
if users.any?
  users.each do |user|
    # Csak akkor hozunk létre új rekordokat, ha a felhasználónak még nincsenek
    if user.fields.count < 30
      (30 - user.fields.count).times do
        fertilizer = [true, false].sample
        leased = [true, false].sample

        user.fields.create!(
          name: Faker::Address.community,
          location_name: Faker::Address.city,
          location_latitude: Faker::Address.latitude,
          location_longitude: Faker::Address.longitude,
          current_crop: Faker::Food.vegetables,
          sowing_date: Faker::Date.between(from: '2024-01-01', to: '2024-08-01'),
          harvest_date: Faker::Date.between(from: '2025-01-01', to: '2025-12-01'),
          size: rand(1..100),
          fertilizer: fertilizer,
          fertilizer_type: fertilizer ? Faker::Food.spice : nil,
          fertilizer_usage: fertilizer ? rand(1..50) : nil,
          leased: leased,
          leasing_end_date: leased ? Faker::Date.between(from: '2025-01-01', to: '2030-12-31') : nil
        )
      end
    end

    # Csak akkor hozunk létre új rekordokat, ha a felhasználónak még nincsenek
    if user.cows.count < 30
      (30 - user.cows.count).times do
        lactationstatus = [true, false].sample
        pregnancystatus = [true, false].sample

        user.cows.create!(
          identificationnumber: Faker::Number.unique.number(digits: 12).to_s.rjust(12, '0'),  # Biztosítjuk, hogy 12 karakter hosszú legyen
          breed: Faker::Creature::Animal.name,
          lactationstatus: lactationstatus,
          lastcalvingdate: lactationstatus ? Faker::Date.between(from: '2022-01-01', to: '2024-08-31') : nil,
          pregnancystatus: pregnancystatus,
          fathersementype: pregnancystatus ? Faker::Creature::Animal.name : nil,
          approxcalving: pregnancystatus ? Faker::Date.between(from: '2025-01-01', to: '2025-12-31') : nil
        )
      end
    end
  end
else
  puts "Nincsenek felhasználók az adatbázisban!"
end

puts "Created fields and cows for existing users!"