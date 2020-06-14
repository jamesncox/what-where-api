class ChangeStoresTypeToStoreType < ActiveRecord::Migration[6.0]
  def change
    rename_column :stores, :type, :store_type
  end
end
