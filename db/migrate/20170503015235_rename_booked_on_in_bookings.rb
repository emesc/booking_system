class RenameBookedOnInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :booked_on, :preferred_date
  end
end
