class AddLockableToUser < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.integer  :failed_attempts, :default => 0 
  		t.string   :unlock_token
  		t.datetime :locked_at
	end
  end
end
