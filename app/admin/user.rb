ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :provider
    column :created_at
    column :newsletter
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :locale
      row :zip
      row :country
    end

    panel "Owned projects" do
      table_for user.projects do
        column :title do |project|
          link_to project.title, [:admin, project]
        end
        column :created_at
      end
    end

    panel "Participations" do
      table_for user.participations do
        column :id do |p|
          link_to p.id, [:admin, p]
        end

        column :project
        column :created_at
      end
    end

    panel "Messages" do
      table_for user.messages do
        column :id do |message|
          link_to message.id, [:admin, message]
        end
        column :project
        column :created_at
      end
    end

    panel "Opened abuse reports" do
      table_for user.opened_abuse_reports do
        column :project
        column :reason
        column :created_at
      end
    end

  end

  sidebar "Flags", only: :show do
    attributes_table do
      row :newsletter
    end
  end

  sidebar "Password reset", only: :show do
    attributes_table do
      row :reset_password_token
      row :reset_password_sent_at
    end
  end

  sidebar "Confirmation", only: :show do
    attributes_table do
      row :confirmation_token
      row :confirmed_at
      row :confirmation_sent_at
    end
  end

  sidebar "OAuth", only: :show do
    attributes_table do
      row :uid
      row :provider
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :phone
      f.input :zip
      f.input :country, as: :select, collection: selectable_countries
      f.input :locale
    end

    f.inputs "Flags" do
      f.input :is_admin
      f.input :newsletter
    end

    f.inputs "Location" do
      f.input :latitude
      f.input :longitude
    end

    f.inputs "Password and OAuth" do
      f.input :password
      f.input :password_confirmation
      f.input :uid
      f.input :provider
    end

    f.actions
  end

end
