Orcharding::Repositories.configure do |conf|
  conf.register_fruit_repository Orcharding::FruitRepository
end

Orcharding::Seeder.load_from_json File.read("db/seed_data.json")

