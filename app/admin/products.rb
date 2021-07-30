ActiveAdmin.register Product do
  permit_params :name, :price, :category_id

  index do
    column :id
    column "User Name", :name
    column "category" do |m|
      Category.all.map{|m| m.name}
    end
    column :created_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
