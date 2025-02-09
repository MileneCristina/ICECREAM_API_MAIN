namespace :seed_data do
  desc "Cadastra usuários com múltiplos endereços"
  task create_users_with_addresses: :environment do
    require 'faker'

    # Número de usuários e endereços por usuário
    num_users = 10
    num_addresses_per_user = 2

    puts "Iniciando cadastro de usuários e seus endereços..."

    num_users.times do
      # Criação do usuário
      user = User.create!(
        name: Faker::Name.name,
        gender: ["Male", "Female", "Non-binary"].sample,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(min_length: 8),
        role: ["admin", "user"].sample
      )

      # Criação de múltiplos endereços para o usuário
      num_addresses_per_user.times do
        address = user.addresses.create!(
          street: Faker::Address.street_name,
          number: Faker::Address.building_number,
          neighborhood: Faker::Address.community,
          city: Faker::Address.city,
          zip_code: Faker::Address.zip_code
        )
      end
    end

    puts "Cadastro de usuários e endereços concluído com sucesso!"
  end
end
