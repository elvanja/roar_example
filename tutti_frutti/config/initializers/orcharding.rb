FruitOrcharding::Repositories.configure do |conf|
  conf.register_fruit_repository FruitOrcharding::FruitRepository
end

FruitOrcharding::Seeder.load_from_json File.read("db/seed_data.json")

