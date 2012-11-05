class AddEmailToInformation < ActiveRecord::Migration
  def change
    add_column :information, :email, :string
  end
end
