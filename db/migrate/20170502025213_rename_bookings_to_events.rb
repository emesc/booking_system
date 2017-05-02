class RenameBookingsToEvents < ActiveRecord::Migration[5.0]
  def change
    rename_table :bookings, :events
  end
end
