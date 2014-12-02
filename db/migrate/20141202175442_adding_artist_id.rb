class AddingArtistId < ActiveRecord::Migration
  def change
      add_reference :qwatos, :artist, index: true
  end
end
