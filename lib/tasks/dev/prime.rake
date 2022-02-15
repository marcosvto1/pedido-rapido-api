if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc "Sample data for local development"
    task prime: "db:setup" do
      Employee.create!(name: "Jose", email: "admin@admin.com", type_profile: :admin, password: "admin123")
      Employee.create!(name: "Carlos", email: "attendant@attendant.com", type_profile: :attendant, password: "atendente")
      Employee.create!(name: "Kaio", email: "cook@cook.com", type_profile: :cook, password: "cozinheiro")
    end
  end
end
