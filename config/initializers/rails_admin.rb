
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.model ProductList do
    list do
      field :name
      field :sku_id
      field :price
      field :images do
        formatted_value do
          bindings[:object].images.try(:first)["img_path"]
        end
      end
    end
    create do
      field :name
      field :sku_id
      field :price
      field :description
      field :images
      field :vars
      field :tags, :pg_string_array
      field :categories
      field :expire_date
    end
    edit do
      exclude_fields :images
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
