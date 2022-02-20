if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc "Sample data for local development"
    task prime: "db:setup" do
      Employee.create!(name: "Jose", email: "admin@admin.com", type_profile: :admin, password: "admin123")
      Employee.create!(name: "Carlos", email: "attendant@attendant.com", type_profile: :attendant, password: "atendente")
      Employee.create!(name: "Kaio", email: "cook@cook.com", type_profile: :cook, password: "cozinheiro")

      category = Category.create!(title: "Entradas")
      category.image.attach(
        io: File.open("storage/categories_images/entradas.png"),
        filename: "entradas.png",
      )

      salada_mista = Product.create!(
        name: "Salada Mista",
        description: "Cenoura, vagem, batata, alface, tomate, brocolis, presunto, mussarela, ovo de codorna, palmito, azeitona, ervilha, aspargo e salaminho. Servido com o molho a sua escolha: vinagrete ou mostarda e mel.",
        price: 49.30,
        time_to_prepare: 10,
        category_id: category.id,
      )

      salada_mista.image.attach(
        io: File.open("storage/products_images/salada_mista.jpg"),
        filename: "salada_mista.jpg",
      )

      salpicao = Product.create!(name: "Salpicão", time_to_prepare: 10, description: "Cenoura, batata-palha, pimentão, cebola, presunto, frango, maionese.", price: 50.50, category_id: category.id)
      salpicao.image.attach(
        io: File.open("storage/products_images/salpicao.jpg"),
        filename: "salpicao.jpg",
      )

      salad = Product.create!(name: "CAESARS SALAD", time_to_prepare: 10, description: "Alface, tomate, croûnts, parmesão, frango servidos com molho a sua escolha, mostarda e mel ou vinagrete.", price: 50.50, category_id: category.id)
      salad.image.attach(
        io: File.open("storage/products_images/caesar_salad.jpeg"),
        filename: "caesar_salad.jpeg",
      )

      category = Category.create!(title: "Pratos Especiais")
      category.image.attach(
        io: File.open("storage/categories_images/especiais.png"),
        filename: "especiais.png",
      )

      file_medalhao = Product.create!(
        name: "File Medalhão",
        time_to_prepare: 60,
        description: "Medalhões de filé mignon grelhados, envolvidos com fatias de bacon, molho madeira com champignon, arroz piemontês (Presunto, muçarela e molho branco) e purê de batatas.",
        price: 80.50, category_id: category.id,
      )
      file_medalhao.image.attach(
        io: File.open("storage/products_images/medalhao.jpg"),
        filename: "medalhao.jpg",
      )

      file_parme = Product.create!(
        name: "File Parmegiana",
        time_to_prepare: 60,
        description: "Filé mignon à  milanesa em molho ao sugo, presunto e muçarela gratinados e espaguete salteado na manteiga com salsa..",
        price: 80.50, category_id: category.id,
      )
      file_parme.image.attach(
        io: File.open("storage/products_images/parmegiana.jpg"),
        filename: "parmegiana.jpg",
      )

      touche = Product.create!(
        name: "File a Touche",
        time_to_prepare: 60,
        description: "Filé mignon ao molho madeira com champignon, creme de aspargo e palmito, guarnição francesa ( presunto, ervilha, batata palha e cebola), pure de batata, cheiro verde e arroz com brócolis.",
        price: 97, category_id: category.id,
      )

      touche.image.attach(
        io: File.open("storage/products_images/touche.jpeg"),
        filename: "touche.jpeg",
      )

      category = Category.create!(title: "Não Alcoólicos")
      category.image.attach(
        io: File.open("storage/categories_images/nao_alcoolicas.png"),
        filename: "nao_alcoolicas.png",
      )

      ref = Product.create!(
        name: "Guaraná Antartica",
        time_to_prepare: 60,
        description: "Lata 350 ML",
        price: 8.70,
        category_id: category.id,
      )

      ref.image.attach(
        io: File.open("storage/products_images/quarana.png"),
        filename: "quarana.png",
      )

      coca = Product.create!(
        name: "Coca Cola",
        time_to_prepare: 0,
        description: "Lata 350 ML",
        price: 8.70,
        category_id: category.id,
      )

      coca.image.attach(
        io: File.open("storage/products_images/coca.jpg"),
        filename: "coca.jpg",
      )

      zero = Product.create!(
        name: "Coca Cola Zero",
        time_to_prepare: 0,
        description: "Lata 350 ML",
        price: 8.70,
        category_id: category.id,
      )

      zero.image.attach(
        io: File.open("storage/products_images/cocazero.jpg"),
        filename: "cocazero.jpg",
      )

      category = Category.create!(title: "Pratos Principais")
      category.image.attach(
        io: File.open("storage/categories_images/principais.png"),
        filename: "principais.png",
      )

      lombo = Product.create!(
        name: "LOMBO GRENADINE",
        time_to_prepare: 120,
        description: "Lombo suíno grelhado com bacon, arroz à grega (Presunto, pimentão, cenoura e uva passas), batata palha, farofa de presunto e ovo e cheiro verde.",
        price: 82.70,
        category_id: category.id,
      )

      lombo.image.attach(
        io: File.open("storage/products_images/lombo.jpg"),
        filename: "lombo.jpg",
      )
    end
  end
end
