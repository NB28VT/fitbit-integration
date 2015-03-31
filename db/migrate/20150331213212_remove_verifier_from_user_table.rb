class RemoveVerifierFromUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :verifier
  end

  def down
    add_column :users, :verifier, :string
  end
end
