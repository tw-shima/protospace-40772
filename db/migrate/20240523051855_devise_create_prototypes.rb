# frozen_string_literal: true

class DeviseCreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.text :title,      null:false
      t.text :catch_copy,   null: false
      t.text :concept,      null: false
      t.references :user,   null: false, foreign_key: true
    end
  end
end
