class AddCellToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :cell, :string
  end
end
