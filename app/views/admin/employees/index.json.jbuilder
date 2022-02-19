json.employees do
    json.array! @employees do |employee|
        json.(employee, :id, :name, :email, :type_profile, :status)
    end
end