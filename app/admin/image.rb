ActiveAdmin.register Image do
  show title: :id do
    attributes_table do
      row :id
      row :project
      row :alt
    end

    panel :image do
      image_tag image.image.url(:normal)
    end
  end

  sidebar :dates, only: :show do
    attributes_table do
      row :created_at
      row :updated_at
    end
  end
end