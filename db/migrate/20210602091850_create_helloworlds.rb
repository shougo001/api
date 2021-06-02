class CreateHelloworlds < ActiveRecord::Migration[6.1]
  def change
    create_table :helloworlds do |t|
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
