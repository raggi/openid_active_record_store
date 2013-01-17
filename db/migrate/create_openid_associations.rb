class CreateOpenidAssociations < ActiveRecord::Migration

  def self.up
    create_table :openid_associations do |t|
      t.datetime  :issued_at
      t.integer   :lifetime
      t.string    :assoc_type
      t.text      :handle
      t.binary    :secret

      t.string    :target, :size => 32
      t.text      :server_url

      t.timestamps
    end
    
    add_index :openid_associations, [:target], :name => 'for_lookups_by_target'
  end

  def self.down
    drop_table :openid_associations
  end

end
