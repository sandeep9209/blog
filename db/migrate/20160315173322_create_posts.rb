class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :appointment
      t.text :about
      t.datetime :time
      t.datetime :posted_at


      t.timestamps
    end
  end
end
