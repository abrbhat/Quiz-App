class AddStatusToQuizViewLog < ActiveRecord::Migration
  def change
  	add_column :quiz_view_logs, :status, :string
  end
end
