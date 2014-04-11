class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :session_tokens do |t|
      t.string :digest
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
