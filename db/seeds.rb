10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    encrypted_password: BCrypt::Password.create('password')
  )
end

# Create Item Groups
10.times do
  ItemGroup.create!
end

# Define unique Faker data for each treasure_box
treasure_box_data = {
  1 => { item_type: 'ConsumeItem', data: -> { Faker::Games::Pokemon.name } },
  2 => { item_type: 'WeaponItem', data: -> { Faker::Games::ElderScrolls.weapon } },
  3 => { item_type: 'ConsumeItem', data: -> { Faker::Games::Zelda.item } },
  4 => { item_type: 'WeaponItem', data: -> { Faker::Games::Minecraft.enchantment } },
  5 => { item_type: 'ConsumeItem', data: -> { Faker::Games::LeagueOfLegends.summoner_spell } },
  6 => { item_type: 'WeaponItem', data: -> { Faker::Movies::StarWars.vehicle } },
  7 => { item_type: 'ConsumeItem', data: -> { Faker::Movies::HarryPotter.spell } },
  8 => { item_type: 'WeaponItem', data: -> { Faker::Games::Minecraft.item } },
  9 => { item_type: 'ConsumeItem', data: -> { Faker::Books::Dune.character } },
  10 => { item_type: 'WeaponItem', data: -> { Faker::Games::LeagueOfLegends.champion } }
}

# Create Treasure Boxes with unique Faker data
treasure_box_data.each do |tb_id, tb_data|
  item_group = ItemGroup.create!
  treasure_box = TreasureBox.create!(
    id: tb_id,
    item_group: item_group
  )

  # Create associated items and lottery machines
  5.times do
    item_name = tb_data[:data].call
    item_type = tb_data[:item_type]
    item = item_type.constantize.create!(
      name: item_name,
      kind: rand(1..3)
    )

    ItemGroupLotteryMachine.create!(
      item_group: item_group,
      item_quantity: rand(1..5),
      item_type: item_type,
      item_id: item.id,
      weight: rand.round(2) # 0.0 to 1.0
    )
  end
end

puts "Seed data created successfully!"