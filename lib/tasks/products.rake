namespace :seed_data do
  desc "Cadastra categorias e produtos"
  task create_categories_and_products: :environment do
    require 'faker'

    # Define o número de categorias e produtos que serão criados
    num_categories = 5
    num_products_per_category = 10

    puts "Iniciando cadastro de categorias e produtos..."

    # Criação de categorias
    num_categories.times do
      category = Category.create!(
        title: Faker::Commerce.department(max: 1),
        description: Faker::Lorem.sentence(word_count: 10)
      )

      # Criação de produtos para cada categoria
      num_products_per_category.times do
        product = category.products.create!(
          title: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph(sentence_count: 3),
          brand: Faker::Company.name,
          value: Faker::Commerce.price(range: 10.0..100.0),
          size: ["Small", "Medium", "Large"].sample,
          quantity: rand(1..50)
        )
      end
    end

    puts "Cadastro de categorias e produtos concluído com sucesso!"
  end
end
