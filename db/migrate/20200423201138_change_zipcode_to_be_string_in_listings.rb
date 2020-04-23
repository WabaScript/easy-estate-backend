class ChangeZipcodeToBeStringInListings < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :zipcode, :string
  end
end
