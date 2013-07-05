class CreateJobStates < ActiveRecord::Migration
  def change
    create_table :job_states do |t|
      t.integer :job_id
      t.integer :completion
    end
  end
end
