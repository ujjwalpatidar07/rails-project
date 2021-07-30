ActiveAdmin.register Company do
  permit_params :name, pictures_attributes: [:id, :name, :attachment, :_destroy]


  form do |f|
    f.inputs 'Details' do
      f.input :name, :required => true
    end
    
    f.inputs 'Product Gallery' do
      f.has_many :pictures do |c|
        c.input :name
        c.input :attachment, as: :file 
        c.input :_destroy, :as => :boolean
      end
    end
    f.actions
  end

  show do |company|
    attributes_table do
      row :name
      row "Images" do
        ul do
          company.pictures.each do |image|
            li do
              image_tag url_for(image.attachment.variant(resize_to_limit: [200, 200]).processed ) if image.attachment.attached?
            end
          end
        end
      end
    end
  end

end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
