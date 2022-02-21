if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc "Sample data for local development"
    task prime: "db:setup" do
      Employee.create!(name: "Jose", email: "admin@admin.com", type_profile: :admin, password: "admin123")
      Employee.create!(name: "Carlos", email: "attendant@attendant.com", type_profile: :attendant, password: "atendente")
      Employee.create!(name: "Kaio", email: "cook@cook.com", type_profile: :cook, password: "cozinheiro")

      category = Category.create!(title: "Pratos Principais")
      category.image.attach(
        io: File.open("public/products_images/pratos_principais.jpg"),
        filename: "pratos_principais.jpg",
      )

      lombo_mineira = Product.create!(
        name: "Lombo à Mineira",
        time_to_prepare: 120,
        description: "Lombo suíno grelhado, arroz branco, tutu de feijão, couve refogada, ovo frito mal passado, banana frita, bacon e batata-palha.",
        price: 83.10,
        category_id: category.id,
      )

      lombo_mineira.image.attach(
        io: File.open("public/products_images/lombo_a_mineira.jpg"),
        filename: "lombo_a_mineira.jpg",
      )

      espaguete_bolonhesa = Product.create!(
        name: "Espaguete Bolonhesa",
        time_to_prepare: 240,
        description: "Molho bolonhesa em ragu ou pedaços de filé mignon, cebola, cheiro verde e creme de leite",
        price: 54.00,
        category_id: category.id,
      )

      espaguete_bolonhesa.image.attach(
        io: File.open("public/products_images/espaguete_a_bolonhesa.jpg"),
        filename: "espaguete_a_bolonhesa.jpg",
      )

      frango_kiev = Product.create!(
        name: "Frango à Kiev",
        time_to_prepare: 360,
        description: "Peito de frango empanado recheado com creme de catupiry e servido com arroz piemontês (Presunto, muçarela e molho branco), palmito, purê de batata e batata-palha.",
        price: 69.80,
        category_id: category.id,
      )

      frango_kiev.image.attach(
        io: File.open("public/products_images/kiev.jpg"),
        filename: "kiev.jpg",
      )

      category = Category.create!(title: "Sobremesas")
      category.image.attach(
        io: File.open("public/products_images/sobremesas.png"),
        filename: "sobremesas.png",
      )

      creme_mamao_papaya = Product.create!(
        name: "Creme Mamão Papaya",
        time_to_prepare: 60,
        description: "Sorvete de creme batido com mamão papaya e creme de cassis.",
        price: 21.30,
        category_id: category.id,
      )

      creme_mamao_papaya.image.attach(
        io: File.open("public/products_images/creme_de_mamao_papaya.png"),
        filename: "creme_de_mamao_papaya.png",
      )

      quindim = Product.create!(
        name: "Quindim",
        time_to_prepare: 60,
        description: "Quindim.",
        price: 13.00,
        category_id: category.id,
      )

      quindim.image.attach(
        io: File.open("public/products_images/quindim.jpg"),
        filename: "quindim.jpg",
      )

      category = Category.create!(title: "Carta de Vinhos")
      category.image.attach(
        io: File.open("public/products_images/carta_de_vinhos.jpg"),
        filename: "carta_de_vinhos.jpg",
      )

      alamos = Product.create!(
        name: "Alamos Malbec Rose",
        time_to_prepare: 60,
        description: "Vinho Rosé 750 ml - Ótimo rosado de Catena Zapata, este Malbec é encorpado e marcante, com bouquet exuberante de frutas maduras, muito fresco e saboroso no palato.",
        price: 168.00,
        category_id: category.id,
      )

      alamos.image.attach(
        io: File.open("public/products_images/alamos_malbec_rose.jpg"),
        filename: "alamos_malbec_rose.jpg",
      )

      uxmal = Product.create!(
        name: "Uxmal Syrah - Malbec TT",
        time_to_prepare: 60,
        description: "Vinho tinto 750 ml - Uxmal Syrah Malbec é um verdadeiro achado, Intenso, cheio de fruta e com delicioso toque de carvalho, é um ótimo Malbec no melhor estilo argentino. Na boca é rico, concentrado e macio, com uma elegância e complexidade.",
        price: 140.00,
        category_id: category.id,
      )

      uxmal.image.attach(
        io: File.open("public/products_images/uxmal-syrah-malbec.jpg"),
        filename: "uxmal-syrah-malbec.jpg",
      )

      clos = Product.create!(
        name: "Clos de los Siete TT",
        time_to_prepare: 60,
        description: "Vinho tinto Malbec 750 ml - 2011 Frutas maduras, especiarias e tosta no nariz, com certa intensidade. Taninos macios, moderada acidez e amadeirado em boca. Aeração instantânea.",
        price: 159.48,
        category_id: category.id,
      )

      clos.image.attach(
        io: File.open("public/products_images/clos_de_los_siete.png"),
        filename: "clos_de_los_siete.png",
      )
    end
  end
end
