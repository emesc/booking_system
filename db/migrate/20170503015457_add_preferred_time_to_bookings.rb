class AddPreferredTimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :preferred_time, :time
  end
end
